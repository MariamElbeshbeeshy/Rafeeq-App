import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

ThemeData AppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: kWhiteBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kWhiteBackgroundColor,
      foregroundColor: Color(0xff191300),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Color(0xffB3B3B3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      hintStyle: TextStyle(color: Color(0xff9CA3AF)),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.black)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "cairo",
        ),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteBackgroundColor,
        disabledBackgroundColor: Color(0xffCCCCCC),
        disabledForegroundColor: kWhiteBackgroundColor,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "cairo",
        ),
        backgroundColor: kWhiteBackgroundColor,
        foregroundColor: kPrimaryColor,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: kPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
  );
}
