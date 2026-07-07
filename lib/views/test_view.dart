import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/views/quistions/mcq_view.dart';
import 'package:rafeeq_app/widgets/background_widget.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  static String id = "Test view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: BackgroundWidget(
        children: [
          //Foreground Screen Design
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'أهلًا بك في رفيق',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 32.sp,
                  ),
                ),

                SizedBox(height: 10.h),
                Text(
                  "المساعد الذكي لتطوير مهارات طفلك",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ),

                SizedBox(height: 20.h),

                ///Start test container  ///
                Container(
                  //height: 407.h,
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
                  child: Column(
                    children: [
                      Text(
                        "حل الأنشطة الآتية لتحديد",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "مستواك",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "فكر على مهل",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            McqView.id,
                            (Route<dynamic> route) =>
                                route.settings.name == TestView.id,
                          );
                        },
                        child: Text("ابدأ الآن"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
