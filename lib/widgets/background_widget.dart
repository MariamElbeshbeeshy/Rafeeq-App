import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/positioned_cloud_icon.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key ,required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          PositionedCloudIcon(leftPosition: -36.w, topPosition: 51.h),
          PositionedCloudIcon(leftPosition: 131.w, topPosition: 134.h),
          PositionedCloudIcon(leftPosition: 344.w, topPosition: 115.h),
          ...children,

      ],
    );
  }
}