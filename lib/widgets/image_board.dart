import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class ImageBoard extends StatelessWidget {
  final List<String> images;

  const ImageBoard({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5.w,
      runSpacing: 0.h,
      children: List.generate(
        images.length,
        (index) => Container(
          // width: 90.w,
          // height: 90.h,
          margin: const EdgeInsets.only(bottom: 35),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kPrimaryColor.withValues(alpha: 0.07),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: kPrimaryColor.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Text(
              images[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.sp, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
