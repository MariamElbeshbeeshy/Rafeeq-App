import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/quiz%20cubit/quiz_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/option_model.dart';
import 'package:rafeeq_app/models/questions_model.dart';
import 'package:rafeeq_app/widgets/audio_bar.dart';
import 'package:rafeeq_app/widgets/image_board.dart';
import 'package:rafeeq_app/widgets/letter_positions_widget.dart';
import 'package:rafeeq_app/widgets/passage_content.dart';
import 'package:rafeeq_app/widgets/word_list.dart';

class Mcq extends StatefulWidget {
  final List<OptionModel> options;
  final QuestionModel question;
  const Mcq({super.key, required this.options, required this.question});

  @override
  State<Mcq> createState() => _McqState();
}

class _McqState extends State<Mcq> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    debugPrint("Question Type: ${widget.question.type}");
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.question.type == QuestionContentType.passage)
          PassageContent(content: widget.question.content.first),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.question.text,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          trailing: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(50.sp),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.volume_up, color: kSecondaryColor, size: 25),
              ),
            ),
          ),
        ),
        SizedBox(height: 35.h),
        _buildContent(),
        if (widget.question.audioUrl != null)
          AudioPlayerBar(audioUrl: widget.question.audioUrl ?? ''),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: isSelected
                      ? kPrimaryColor.withValues(alpha: 0.07)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isSelected
                        ? kPrimaryColor.withValues(alpha: 0.3)
                        : kGrayColor,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? kPrimaryColor
                              : const Color(0xFF718096),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? kPrimaryColor
                                : const Color(0xFF718096),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        widget.options[index].text,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: isSelected
                              ? kPrimaryColor
                              : const Color(0xFF4A5568),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 35.h),

        ElevatedButton(
          onPressed: selectedIndex != null
              ? () {
                  final selectedAnswerId = widget.options[selectedIndex!].id;
                  context.read<QuizCubit>().submitAnswerAndNext(
                    selectedAnswerId,
                  );

                  setState(() {
                    selectedIndex = null;
                  });
                }
              : null,
          child: Text("التالي"),
        ),
      ],
    );
  }

  Widget _buildContent() {
    final type = widget.question.type;
    switch (type) {
      case QuestionContentType.emoji:
        return ImageBoard(images: widget.question.content);
      case QuestionContentType.wordList:
      case QuestionContentType.word:
      case QuestionContentType.wordIncomplete:
      case QuestionContentType.confusedPair:
      case QuestionContentType.wordDisplay:
        return WordList(words: widget.question.content);
      case QuestionContentType.letterPositions:
        return LetterPositionsWidget(letterData: widget.question.content);
      default:
        return SizedBox.shrink();
    }
  }
}
