import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';

class WordList extends StatelessWidget {
  final List<String> words;

  const WordList({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 5.w,
      runSpacing: 0.h,
      children: List.generate(
        words.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Container(
            width: 100.w,
            height: 40.h,
            margin: const EdgeInsets.only(bottom: 35),
            decoration: BoxDecoration(
              color: kPrimaryColor.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: kPrimaryColor.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Center(
                child: Text(
                  words[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.sp, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
