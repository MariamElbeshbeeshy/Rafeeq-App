import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class StreakCard extends StatelessWidget {
  final String label;
  final int dayNumber;
  final bool completed;
  final bool isToday;

  const StreakCard({
    super.key,
    required this.label,
    required this.dayNumber,
    this.completed = false,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = completed ? kPrimaryColor : Colors.white;
    final borderColor = completed ? kPrimaryColor : const Color(0xffD9D9D9);
    final textColor = completed ? Colors.white : const Color(0xff364153);

    return Container(
      width: 56.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          if (completed)
            BoxShadow(
              color: kShadowColor,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$dayNumber',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.sp,
              color: textColor,
              fontWeight: isToday ? FontWeight.w800 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
