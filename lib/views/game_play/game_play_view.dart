import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/child%20cubit/child_cubit.dart';
import 'package:rafeeq_app/cubits/game_play/game_play_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/views/navigation_view.dart';
import 'package:rafeeq_app/widgets/animated_bottom_feedback.dart';
import 'package:rafeeq_app/widgets/mcq.dart';
import 'package:rafeeq_app/widgets/questions_header.dart';
import 'package:rafeeq_app/widgets/quiz_progress_bar.dart';

class GamePlayView extends StatelessWidget {
  final int levelId;
  const GamePlayView({super.key, required this.levelId});
  static String id = "Game Play view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamePlayCubit()..startSession(levelId),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<GamePlayCubit, GamePlayState>(
            listener: (context, state) {
              if (state is GamePlayFinished) {
                ShowMessage(
                  context,
                  "لقد أنهيت المستوى الأول وحصلت على 10 نقاط",
                  [],
                );
                context.read<ChildCubit>().getChildData();
                Future.delayed(const Duration(seconds: 10), () {
                  Navigator.pop(context);
                });
              } else if (state is GamePlayError) {
                ShowMessage(context, state.message, [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("حاول مرة أخرى"),
                  ),
                ]);
              }
            },
            listenWhen: (previous, current) =>
                current is GamePlayError || current is GamePlayFinished,
            buildWhen: (previous, current) =>
                current is GamePlayDisplayQuestion ||
                current is GamePlayLoadingStage,
            builder: (context, state) {
              if (state is GamePlayLoadingStage) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else if (state is GamePlayDisplayQuestion) {
                final currentQuestion =
                    state.stageQuestions[state.currentQuestionIndex];
                final options = currentQuestion.options;

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuestionHeader(),
                              QuizProgressBar(
                                currentQuestionIndex:
                                    state.currentQuestionIndex + 1,
                                totalQuestions: state.stageQuestions.length,
                              ),
                              SizedBox(height: 20.h),
                              Mcq(
                                options: options,
                                question: currentQuestion,
                                selectedIndex: state.currentSelectedIndex,
                                onSelect: (index) {
                                  context.read<GamePlayCubit>().selectAnswer(
                                    index,
                                  );
                                },
                                submit: () {
                                  context
                                      .read<GamePlayCubit>()
                                      .submitAnswerAndNext();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    AnimatedBottomFeedback(),
                  ],
                );
              }
              return const Text("Unhandled state");
            },
          ),
        ),
      ),
    );
  }
}
