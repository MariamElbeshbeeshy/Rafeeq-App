import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/audio%20cubit/audio_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/GamePlayModels/option_model.dart';
import 'package:rafeeq_app/models/GamePlayModels/question_content_type.dart';
import 'package:rafeeq_app/models/GamePlayModels/questions_model.dart';
import 'package:rafeeq_app/widgets/audio_bar.dart';
import 'package:rafeeq_app/widgets/image_board.dart';
import 'package:rafeeq_app/widgets/letter_positions_widget.dart';
import 'package:rafeeq_app/widgets/passage_content.dart';
import 'package:rafeeq_app/widgets/word_list.dart';

class Mcq extends StatelessWidget {
  final List<OptionModel> options;
  final QuestionModel question;
  final int? selectedIndex;
  final ValueChanged<int> onSelect;
   
  const Mcq({
    super.key,
    required this.options,
    required this.question,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {

    debugPrint("Question Type: ${question.type}");
    final  AudioCubit _cubit = AudioCubit();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (question.type == QuestionContentType.passage)
          PassageContent(content: question.content.first),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            question.text,
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
                onPressed: () async {
                  await _cubit.loadAudio('audio/$question.mp3');
                  _cubit.play();
                },
                icon: Icon(Icons.volume_up, color: kSecondaryColor, size: 25),
              ),
            ),
          ),
        ),
        SizedBox(height: 35.h),
        _buildContent(),
        if (question.audioUrl != null)
          AudioPlayerBar(audioPath:'audio/a$question.mp3' ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                onSelect(index);
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
                        options[index].text,
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
      ],
    );
  }

  Widget _buildContent() {
    final type = question.type;
    switch (type) {
      case QuestionContentType.emoji:
        return ImageBoard(images: question.content);
      case QuestionContentType.wordList:
      case QuestionContentType.word:
      case QuestionContentType.wordIncomplete:
      //case QuestionContentType.confusedPair:
      case QuestionContentType.wordDisplay:
        return WordList(words: question.content);
      case QuestionContentType.letterPositions:
        return LetterPositionsWidget(letterData: question.content);
      default:
        return SizedBox.shrink();
    }
  }
}
