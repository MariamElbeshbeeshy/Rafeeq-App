import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedCloudIcon extends StatelessWidget {
  final double leftPosition, topPosition;
  const PositionedCloudIcon({
    super.key,
    required this.leftPosition,
    required this.topPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: topPosition,
      child: Image.asset("assets/images/image.png", height: 60.h, width: 71.w),
    );
  }
}
