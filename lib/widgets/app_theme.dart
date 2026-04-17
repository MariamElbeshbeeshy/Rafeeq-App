import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

ThemeData AppTheme({required String fontFamily}) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: fontFamily,
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
          fontFamily: fontFamily,
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
          fontFamily: fontFamily,
        ),
        backgroundColor: kWhiteBackgroundColor,
        foregroundColor: kPrimaryColor,
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: kPrimaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: fontFamily,
        color: Color(0xff101828),
      ),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 7,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
      activeTrackColor: kPrimaryColor, // The yellow from your image
      inactiveTrackColor: Color(0xffE0E0E0),
      thumbColor: Colors.white, // White thumb like the image
    ),
  );
}
