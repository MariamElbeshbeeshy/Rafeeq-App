import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/views/otp_view.dart';
import 'package:rafeeq_app/widgets/or_divider.dart';
import 'package:rafeeq_app/widgets/register_now_section.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnabled = false;
    return Form(
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
          Spacer(flex: 3),
          Text(
            'البريد الإلكتروني',
            style: TextStyle(
              color: Color(0xff0B2728),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          TextFormField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(hintText: "john@example.com"),
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
            textAlign: TextAlign.end,
            decoration: InputDecoration(hintText: "3015518094994*"),
          ),
          Spacer(flex: 2),
          ElevatedButton(
            onPressed: isEnabled ? () { Navigator.pushNamed(context, OtpView.id);} : null,
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




