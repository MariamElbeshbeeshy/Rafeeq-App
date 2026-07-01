import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/quiz%20cubit/quiz_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/views/navigation_view.dart';
import 'package:rafeeq_app/widgets/mcq.dart';
import 'package:rafeeq_app/widgets/quiz_progress_bar.dart';

class McqView extends StatelessWidget {
  const McqView({super.key});
  static String id = "MCQ view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => QuizCubit()..fetchStageQuestions(),
          child: BlocConsumer<QuizCubit, QuizState>(
            listener: (context, state) {
              if (state is QuizSuccessFinished) {
                ShowMessage(
                  context,
                  "لقد أكملت الاختبار بنجاح وتم وضع خطة مناسبة لمستواك!",
                  [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          NavigationView.id,
                          (Route<dynamic> route) =>
                              route.settings.name == McqView.id,
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: kPrimaryColor,
                      ),
                      child: Text("ابدأ رحلتك مع رفيق"),
                    ),
                  ],
                );
              }
              if (state is QuizError) {
                ShowMessage(context, state.message, [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(foregroundColor: kPrimaryColor),
                    child: Text("حاول مرة أخرى"),
                  ),
                ]);
              }
            },
            builder: (context, state) {
              if (state is QuizLoadingStage) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              }
              if (state is QuizDisplayQuestion) {
                final currentQuestion =
                    state.stageQuestions[state.currentQuestionIndex];
                final options = currentQuestion.options;

                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuizProgressBar(
                        currentQuestionIndex: state.currentQuestionIndex + 1,
                        totalQuestions: state.stageQuestions.length,
                      ),
                      SizedBox(height: 20.h),
                      Mcq(options: options, question: currentQuestion.text),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator(color: kPrimaryColor);
            },
          ),
        ),
      ),
    );
  }
}
