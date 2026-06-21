import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/upload%20cubit/upload_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';
import 'package:rafeeq_app/views/OCR/take_image_view.dart';
import 'package:rafeeq_app/views/OCR/upload_file_view.dart';
import 'package:rafeeq_app/views/OCR/paste_text_view.dart';
import 'package:rafeeq_app/views/OCR/uploading_view.dart';
import 'package:rafeeq_app/widgets/coins_widget.dart';
import 'package:rafeeq_app/widgets/level_widget.dart';

class OcrView extends StatefulWidget {
  const OcrView({super.key});
  static String id = 'ocr view';

  @override
  State<OcrView> createState() => _OcrViewState();
}

class _OcrViewState extends State<OcrView> {
  UserDataModel? userInfo = UserLocalServices().getUserData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
                child: CoinsWidget(coins: userInfo!.points ?? 0),
              ),
            ],
            title: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: LevelWidget(level: userInfo!.level),
            ),
          ),

          body: Padding(
            padding: EdgeInsetsGeometry.all(16),

            child: Column(
              children: [
                SizedBox(height: 20.h),
                Container(
                  constraints: BoxConstraints(minHeight: 56.h),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius: BorderRadius.circular(14),
                    border: BoxBorder.all(color: kPrimaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(254, 193, 8, 0.12),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: TabBar(
                    tabs: [Text("تحميل ملف"), Text("صور صفحة"), Text("لصق نص")],
                  ),
                ),
                SizedBox(height: 32.h),
                Expanded(
                  child: BlocBuilder<UploadCubit, UploadState>(
                    builder: (context, state) {
                      return TabBarView(
                        children: [
                          if (state is UploadInProgress) UploadScreen(),

                          UploadFileView(),
                          TakeImageView(),
                          PasteTextView(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
