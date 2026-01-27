import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'Log In View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: kSecondaryColor),
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: [
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
          Positioned(
            left: -36.w,
            top: 51.h,
            child: Image.asset(
              "assets/images/image.png",
              height: 60.h,
              width: 71.w,
            ),
          ),
          Positioned(
            left: 131.w,
            top: 134.h,
            child: Image.asset(
              "assets/images/image.png",
              height: 60.h,
              width: 71.w,
            ),
          ),
          Positioned(
            left: 344.w,
            top: 115.h,
            child: Image.asset(
              "assets/images/image.png",
              height: 60.h,
              width: 71.w,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 50.h),
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
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "المساعد الذكي لتطوير مهارات طفلك",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 562.h,
                width: 341.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: kWhiteBackground,
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 4.r,
                      spreadRadius: 0,
                      offset: Offset(0.h, 4.h),
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      //SizedBox(height: 30.h),
                      Text(
                        'البريد الإلكتروني',
                        style: TextStyle(
                          color: Color(0xff0B2728),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      TextFormField(),
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
                      TextFormField(),
                      Spacer(flex: 2),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('تسجيل الدخول'),
                      ),
                      Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Divider(
                              endIndent: 20.w,
                              thickness: 1.h,
                              height: 1.h,
                              color: Color.fromARGB(255, 212, 215, 220),
                            ),
                          ),
                          Text('أو'),
                          Expanded(
                            child: Divider(
                              indent: 20.w,
                              thickness: 1.h,
                              height: 1.h,
                              color: Color.fromARGB(255, 212, 215, 220),
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 2),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('تسجيل الدخول'),
                      ),
                      Spacer(flex: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('لا يوجد لديك حساب؟ '),
                          GestureDetector(
                            child: Text(
                              'أنشئ حسابًا الآن',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
