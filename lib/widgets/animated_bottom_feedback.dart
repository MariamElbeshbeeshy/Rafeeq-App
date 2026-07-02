import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/game_play/game_play_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';

class AnimatedBottomFeedback extends StatelessWidget {
  const AnimatedBottomFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamePlayCubit, GamePlayState>(
      buildWhen: (previous, current) =>
          current is QuestionsCorrectAnswer ||
          current is QuestionsWrongAnswer ||
          current is GamePlayDisplayQuestion,
      builder: (context, state) {
        Color barColor = Colors.white;
        String feedbackText = "";
        IconData? feedbackIcon;
        Color contentColor = Colors.transparent;
        int? selectedIndex;

        if (state is GamePlayDisplayQuestion) {
          selectedIndex = state.currentSelectedIndex;
        }

        if (state is QuestionsCorrectAnswer) {
          barColor = kSecondaryColor;
          feedbackText = state.feedbackMessage.isNotEmpty
              ? state.feedbackMessage
              : "إجابة رائعة يا بطل! 🌟";
          feedbackIcon = Icons.stars_rounded;
          contentColor = const Color(0xFF2E7D32);
        } else if (state is QuestionsWrongAnswer) {
          barColor = const Color(0xFFFFEBEE);
          feedbackText = state.feedbackMessage.isNotEmpty
              ? state.feedbackMessage
              : "حاول مرة أخرى، أنت ذكي! 💪";
          feedbackIcon = Icons.sentiment_dissatisfied_rounded;
          contentColor = const Color(0xFFC62828);
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.infinity,
          height: 100.h,
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child:
                (state is QuestionsCorrectAnswer ||
                    state is QuestionsWrongAnswer)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(feedbackIcon, color: contentColor, size: 28.w),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          feedbackText,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: contentColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      onPressed: selectedIndex == null
                          ? null
                          : () {
                              context
                                  .read<GamePlayCubit>()
                                  .submitAnswerAndNext();
                            },
                      child: Text(
                        "تأكيد الإجابة",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == null
                              ? Colors.grey.shade500
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
