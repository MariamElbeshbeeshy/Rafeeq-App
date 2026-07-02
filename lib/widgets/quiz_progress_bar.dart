import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class QuizProgressBar extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;

  const QuizProgressBar({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = currentQuestionIndex / totalQuestions;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: progressValue,
            backgroundColor: kGrayColor,
            valueColor: const AlwaysStoppedAnimation<Color>(kPrimaryColor),
            minHeight: 8.h,
            borderRadius: BorderRadius.circular(10.r),
          ),
          SizedBox(height: 12.h),
          Text(
            "السؤال $currentQuestionIndex من $totalQuestions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
