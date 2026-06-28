import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.dynamicColor,
    required this.item,
    required this.index,
  });

  final int index;
  final Color dynamicColor;
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigation to Question Screen
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        height: 92.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(36.r),
            bottomRight: Radius.circular(36.r),
            topLeft: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60.w,
              height: double.infinity,
              decoration: BoxDecoration(
                color: dynamicColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36.r),
                  bottomRight: Radius.circular(36.r),
                  topLeft: Radius.circular(36.r),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D3748),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item["title"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2D3748),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item["level"],
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: kPrimaryColor,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
