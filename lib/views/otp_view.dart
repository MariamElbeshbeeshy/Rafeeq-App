import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/widgets/otp_form.dart';
import 'package:rafeeq_app/widgets/positioned_cloud_icon.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});
  static String id = 'Log In View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
          //Background Screen Design
          Container(
            height: 487.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55.r),
                bottomRight: Radius.circular(55.r),
              ),
              color: kSecondaryColor,
            ),
          ),
          PositionedCloudIcon(leftPosition: -36.w, topPosition: 51.h),
          PositionedCloudIcon(leftPosition: 131.w, topPosition: 134.h),
          PositionedCloudIcon(leftPosition: 344.w, topPosition: 115.h),

          //Foreground Screen Design
          ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'أهلًا بك في رفيق',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 32.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  //otp Card Design
                  Container(
                    height: 407.h,
                    width: 341.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 42.h,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: kWhiteBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: kShadowColor,
                          blurRadius: 4.r,
                          spreadRadius: 0,
                          offset: Offset(0.h, 4.h),
                        ),
                      ],
                    ),
                    child: OtpForm(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
