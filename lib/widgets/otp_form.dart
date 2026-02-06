import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {

  TextEditingController otpCode =TextEditingController();
  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color(0xffFEC108)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.grey[200],
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(8),
    );

    return Container(
      child: Column(
        children: [
          Text(
            "راجع بريدك الإلكترونى",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 24.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "لقد أرسلنا إليك رمز التأكيد عبر البريد الإلكترونى",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 18.h),

          //// otp  confirmation ////
           Directionality(
            textDirection: TextDirection.ltr,
             child: Pinput(
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                errorPinTheme: errorPinTheme,
                controller: otpCode,
                
                validator: (s) {
                  return s == '1234' ? null : 'رمز التأكيد غير صحيح';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
           ),
          
          SizedBox(height: 24.h),

          ///timer///
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تنتهي صلاحية الدخول خلال   ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              TimerCountdown(
                enableDescriptions: false,
                format: CountDownTimerFormat.minutesSeconds,
                endTime: DateTime.now().add(Duration(minutes: 3, seconds: 0)),
                timeTextStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          /// buttons/ ///
          ElevatedButton(onPressed: () {}, child: Text("تأكيد")),
          SizedBox(height: 16.h),
          OutlinedButton(onPressed: () {}, child: Text("أرسل الرمز مرة أخرى")),
        ],
      ),
    );
  }
}
