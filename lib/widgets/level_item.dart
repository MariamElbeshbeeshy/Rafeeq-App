import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class LevelItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetPath;
  final int completion;
  final bool locked;

  const LevelItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetPath,
    required this.completion,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180.h,
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff364153),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        subtitle,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff7A7A7A),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '$completion% إكمال',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff7A7A7A),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            flex: 3,
                            child: LinearProgressIndicator(
                              value: completion / 100,
                              minHeight: 8.h,
                              backgroundColor: const Color(0xffF3F3F3),
                              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (locked)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: .45),
                ),
              ),
            if (locked)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock, size: 18.sp, color: const Color(0xff364153)),
                        SizedBox(width: 8.w),
                        Text(
                          'مستوى مقفل',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff364153),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
