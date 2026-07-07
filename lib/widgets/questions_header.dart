import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';

class QuestionHeader extends StatefulWidget {
  const QuestionHeader({super.key});

  @override
  State<QuestionHeader> createState() => _QuestionHeaderState();
}

class _QuestionHeaderState extends State<QuestionHeader> {
  final userData = UserLocalServices().getUserData();
  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 45,
          decoration: BoxDecoration(
            color: kPrimaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: kPrimaryColor, width: 1),
          ),
          child: Row(
            children: [
              LevelWidget(level: userData!.level),
              SizedBox(width: 10),
              CoinsWidget(coins: userData!.points ?? 0),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            bookmarked = !bookmarked;
            setState(() {});
          },
          icon: Icon(
            Icons.bookmark,
            color: bookmarked ? kPrimaryColor : Colors.grey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
