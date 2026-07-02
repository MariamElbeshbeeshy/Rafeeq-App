import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/widgets/HomeWidgets/streak_card.dart';

class StreakList extends StatelessWidget {
  const StreakList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFF9E6),
      width: 375.w,
      height: 182.h,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('حافظ على رحلة تعلمك اليوم أيضًا',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize:20.sp,
          ),
          ),
          SizedBox(height: 14.h),

          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentGeometry.topCenter,
              children: [
                
                Container(     
                  width: 343.w,  
                  height: 100.h, 
                  decoration: BoxDecoration(
                    color: Color(0xffFFF2CC),
                    borderRadius: BorderRadius.circular(19)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StreakCard( dayNumber: 1, completed: true),
                      StreakCard( dayNumber: 1, completed: true),
                      StreakCard( dayNumber: 1, completed: false),
                      StreakCard( dayNumber: 1, completed: true),
                      StreakCard( dayNumber: 1, completed: true),
                    ],
                  ),
                  // child:  Row(
                  //   children: streakInfo
                  //       .asMap()
                  //       .entries
                  //       .map(
                  //         (entry) => Padding(
                  //           padding: EdgeInsets.only(right: 8.w),
                  //           child: StreakCard(
                  //             label: entry.value.dayName,
                  //             dayNumber: entry.key + 1,
                  //             completed: entry.value.isCompleted,
                  //             isToday: entry.value.isToday,
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  // ),
                ),
                Positioned(
                  top:-25,
                  child: Image.asset(
                    width: 50.w,
                    height: 50.h,
                    'assets/images/levels/bear.png'
                    ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}