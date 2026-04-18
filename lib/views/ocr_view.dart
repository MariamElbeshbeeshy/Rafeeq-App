import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';

class OcrView extends StatefulWidget {
  const OcrView({super.key});
  static String id = 'ocr view';


  @override
  State<OcrView> createState() => _OcrViewState();
}

class _OcrViewState extends State<OcrView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 38.h,) ,
            Row(
               children: [
                LevelWidget(level: 2),
                Spacer() ,
                CoinsWidget(coins:28 ) ,
               ],
            )
          ],
        ),
      )

    );
  }
}




