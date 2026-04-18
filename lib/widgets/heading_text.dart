import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  final String text;
  const HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
                alignment:
                    Alignment.centerRight, // Align to the right for Arabic
                child: Text(
                  text,
                  //textAlign: ,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364153),
                  ),
                ),
              );
  }
}