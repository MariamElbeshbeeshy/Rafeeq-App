import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/header_level_info.dart';
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
        HeaderLevelInfo(userData: userData),
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


