import 'package:flutter/material.dart';

class LetterPositionsWidget extends StatelessWidget {
  final List<String> letterData;

  const LetterPositionsWidget({super.key, required this.letterData});

  @override
  Widget build(BuildContext context) {
    final String first = letterData[0];
    final String middle = letterData[1];
    final String last = letterData[2];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLetterCard(
                title: "أول الكلمة",
                letter: first,
                cardColor: Colors.teal.shade50,
                textColor: Colors.teal.shade900,
              ),

              _buildLetterCard(
                title: "وسط الكلمة",
                letter: middle,
                cardColor: Colors.amber.shade50,
                textColor: Colors.amber.shade900,
              ),

              _buildLetterCard(
                title: "آخر الكلمة",
                letter: last,
                cardColor: Colors.pink.shade50,
                textColor: Colors.pink.shade900,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLetterCard({
    required String title,
    required String letter,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: textColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: textColor.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: textColor.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            letter,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
