import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
