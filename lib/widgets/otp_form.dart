import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:rafeeq_app/helper/constants.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
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

          //// otp tex fields ////
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 13.w,

            children: [
              SizedBox(width: 50.w, height: 50.h, child: TextFormField()),
              SizedBox(width: 50.w, height: 50.h, child: TextFormField()),
              SizedBox(width: 50.w, height: 50.h, child: TextFormField()),
              SizedBox(width: 50.w, height: 50.h, child: TextFormField()),
            ],
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
          enableDescriptions:false ,
          format: CountDownTimerFormat.minutesSeconds,
          endTime: DateTime.now().add(
            Duration(
              minutes: 3,
              seconds: 0,
            ),
          ),
          timeTextStyle: TextStyle(
            fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 14.sp,
                  
          ),
        ),
            ],
          ),

        SizedBox(height:24.h),

          /// buttons/ ///
        ElevatedButton(
          onPressed: (){}, 
          child: Text("تأكيد")
          ),
        SizedBox(height:16.h),
        OutlinedButton(
          onPressed: (){},
           child: Text("أرسل الرمز مرة أخرى"))
        ],
      ),
    );
  }
}
