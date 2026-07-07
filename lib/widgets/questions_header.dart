import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeq_app/cubits/library%20cubit/library_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/header_level_info.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';

class QuestionHeader extends StatefulWidget {
  final String questionId;
  const QuestionHeader({super.key, required this.questionId});

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
            context.read<LibraryCubit>().addLibraryItem(widget.questionId);
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
