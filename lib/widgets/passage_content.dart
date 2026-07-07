import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';

class PassageContent extends StatelessWidget {
  final String content;

  const PassageContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        color: kPrimaryColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: kPrimaryColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12), // مساحة ل شريط التمرير
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 18,
            height: 1.7,
            fontFamily: 'Cairo',
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
