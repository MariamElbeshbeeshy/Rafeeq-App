import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/widgets/mcq.dart';
import 'package:rafeeq_app/widgets/quiz_progress_bar.dart';

class McqView extends StatefulWidget {
  const McqView({super.key});

  @override
  State<McqView> createState() => _McqViewState();
}

class _McqViewState extends State<McqView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuizProgressBar(currentQuestionIndex: 1, totalQuestions: 5),
              SizedBox(height: 20.h),
              Mcq(),
            ],
          ),
        ),
      ),
    );
  }
}
