import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/login%20cubit/login_cubit.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/views/qr_scan_view.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/widgets/or_divider.dart';
import 'package:rafeeq_app/widgets/register_now_section.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nationalId = TextEditingController();
  bool isButtonEnabled = false;
  String? wrongNationalId ;

  void checkFormFilled() {
    setState(() {
      if (nationalId.text.isEmpty) {
        wrongNationalId = null;
        isButtonEnabled = false;
      } else {
        isButtonEnabled = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    nationalId.addListener(checkFormFilled);
  }

 

 void _submitForm() {
    context.read<LoginCubit>().nationalIdLogin(nationalId: nationalId.text);
  }
  
   @override
 void dispose() {
  nationalId.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: BlocConsumer<LoginCubit, LoginState>(

        listener: (context, state) {
          if (state is LoginSuccess) {

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));

            Navigator.pushNamed(context, OtpView.id);

          } 
          else if (state is LoginFailure) {
            ShowMessage(context, state.errorMessage, []);
          } else if (state is LoginLoading) {
            setState(() {
              wrongNationalId = null;
            });
          }
        } ,
        builder: (context, state) {
          bool isLoading = state is LoginLoading;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Color(0xff0B2728),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Spacer(flex: 2),
              Text(
                'الرقم القومي للطفل',
                style: TextStyle(
                  color: Color(0xff0B2728),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              TextFormField(
                controller: nationalId,
                textAlign: TextAlign.end,
                decoration: InputDecoration(
                  hintText: "3015518094994*",
                  errorText: wrongNationalId,
                ),
                validator: (value) => null,
              ),
              Spacer(flex: 2),
              ElevatedButton(
                onPressed: isButtonEnabled ? _submitForm : null,
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text('تسجيل الدخول'),
              ),
              Spacer(flex: 2),
              OrDivider(),
              Spacer(flex: 2),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QRScanView.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code),
                    SizedBox(width: 5),
                    Text('امسح رمز الـ QR'),
                  ],
                ),
              ),
              Spacer(flex: 3),
              RegisterNowSection(),
            ],
          );
        },
      ),
    );
  }
}
