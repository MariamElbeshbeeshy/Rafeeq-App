import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

ThemeData AppTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: kWhiteBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: kWhiteBackground,
      foregroundColor: kAppBarForeground,
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
        borderSide: BorderSide(color: kGreyBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: kPrimaryColor),
      ),
      hintStyle: TextStyle(color: Colors.grey[400]),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    //textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.black)),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "cairo",
        ),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteBackground,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
  );
}
