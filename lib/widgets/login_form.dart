import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';
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
  String? wrongNationalId = null;
  AuthService authService = AuthService();
  AuthResponseModel? authLogInResponse  ;

  void checkFormFilled() {
    setState(() {

       if (nationalId.text.isEmpty){
        wrongNationalId = null;
        isButtonEnabled =false;
       }
       else{
        isButtonEnabled = true;
       }
       
    });
  }

  @override
  void initState() {
    super.initState();
    nationalId.addListener(checkFormFilled);
  }

  _submitForm() async{
   authLogInResponse = await authService.logIn(
      nationalityId: nationalId.text,
      deviceId: "123",
       deviceName: "iphone",
        projectName: "Rafiq"
        );
          
     if(authLogInResponse!.key == "success"){
      Navigator.pushNamed( context ,OtpView.id);
     }
    else{
      setState(() {
        wrongNationalId ="الرقم القومى غير صحيح ";
      });
    }
      
    
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      
      key: _formKey,
      child: Column(
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
            validator: (value) {
            },
          ),
          Spacer(flex: 2),
          ElevatedButton(
            onPressed: isButtonEnabled?  _submitForm : null,     
            child: Text('تسجيل الدخول'),
          ),
          Spacer(flex: 2),
          OrDivider(),
          Spacer(flex: 2),
          OutlinedButton(
            onPressed: () {},
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
      ),
    );
  }
}
