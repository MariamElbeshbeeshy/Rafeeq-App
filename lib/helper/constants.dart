import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffFEC108);
const Color kSecondaryColor = Color(0xffFFF9E6);
const Color kWhiteBackgroundColor = Color(0xffFAFAFA);
const Color kRedColor = Color(0xffF41A1A);
const Color kGreenColor = Color(0xff80BD52);
const Color kGrayColor = Color(0xffD9D9D9);
const Color kShadowColor = Color.fromARGB(61, 0, 0, 0);
const List<DropdownMenuEntry<String>> kFontOptions = [
  DropdownMenuEntry(
    value: 'Cairo',
    label: 'Cairo',
    labelWidget: Text(
      'Cairo',
      style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.w500),
    ),
  ),
  DropdownMenuEntry(
    value: 'Arial',
    label: 'Arial',
    labelWidget: Text('Arial', style: TextStyle(fontFamily: 'Arial')),
  ),
  DropdownMenuEntry(
    value: 'Inter',
    label: 'Inter',
    labelWidget: Text('Inter', style: TextStyle(fontFamily: 'Inter')),
  ),
  DropdownMenuEntry(
    value: 'PlaypenSansArabic',
    label: 'Playpen Sans Arabic',
    labelWidget: Text(
      'Playpen sans Arabic',
      style: TextStyle(fontFamily: 'PlaypenSansArabic'),
    ),
  ),
  DropdownMenuEntry(
    value: 'Poppins',
    label: 'Poppins',
    labelWidget: Text('Poppins', style: TextStyle(fontFamily: 'Poppins')),
  ),
];
