import 'package:flutter/material.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/ChildModel/user_data_model.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';

class HeaderLevelInfo extends StatelessWidget {
  const HeaderLevelInfo({super.key, required this.userData});

  final UserDataModel? userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
        color: kPrimaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: kPrimaryColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LevelWidget(level: userData!.level),
          SizedBox(width: 10),
          CoinsWidget(coins: userData!.points ?? 0),
        ],
      ),
    );
  }
}
