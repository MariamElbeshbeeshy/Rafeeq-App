import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class StreakCard extends StatelessWidget {
  final int dayNumber;
  final bool completed;

  const StreakCard({
    super.key,
    required this.dayNumber,
    required this.completed ,
    
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = completed ? kPrimaryColor : Colors.transparent;
    final borderColor = completed ? kPrimaryColor : const Color(0xffCB9901);
 
    return Container(
      width: 42.w,
      height: 80.h,
      padding: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Stack(
        alignment: AlignmentGeometry.topCenter,
         children: [
          Text(
            '$dayNumber',
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          if (completed)
            Positioned(
              bottom: -20,
              child: Image.asset(
                height: 70.h,
                width: 70.w,
                'assets/images/levels/bear2.png',
                 fit: BoxFit.cover),
            ),
        ],
      ),
    );
  }
}
