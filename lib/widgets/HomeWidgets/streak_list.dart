import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/models/HomeModel/streak_info_model.dart';
import 'package:rafeeq_app/widgets/HomeWidgets/streak_card.dart';

class StreakList extends StatelessWidget {
  const StreakList({super.key, required this.streakInfo});

  final List<StreakInfo> streakInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 182.h,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E6),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'حافظ على رحلة تعلمك اليوم أيضًا',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 343.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF2CC),
                    borderRadius: BorderRadius.circular(19.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: streakInfo 
                            .toList()
                            .asMap()
                            .entries
                            .map(
                              (entry) => StreakCard(
                                dayNumber: entry.key + 1,
                                completed: entry.value.isCompleted,
                              ),
                            )
                            .toList(),
                  ),
                ),
                Positioned(
                  top: -25,
                  child: Image.asset(
                    width: 50.w,
                    height: 50.h,
                    'assets/images/levels/bear.png',
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