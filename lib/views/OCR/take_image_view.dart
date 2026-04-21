import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/upload%20cubit/upload_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/views/OCR/ocr_camera_view.dart';
import 'package:rafeeq_app/views/OCR/uploading_view.dart';

class TakeImageView extends StatefulWidget {
  const TakeImageView({super.key});

  @override
  State<TakeImageView> createState() => _TakeImageViewState();
}

class _TakeImageViewState extends State<TakeImageView>
    with AutomaticKeepAliveClientMixin<TakeImageView> {
  @override
  bool get wantKeepAlive => true;
  File? file;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (file != null) {
      context.read<UploadCubit>().uploadFile(file!);
      return UploadScreen();
    } else {
      return Container(
        width: 343.w,
        height: 254.h,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 249, 230, 0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(16),
            dashPattern: [10, 10],
            strokeWidth: 2,
            color: kPrimaryColor,
          ),

          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Image.asset(
                  "assets/images/upload.png",
                  width: 80.w,
                  height: 80.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),
                const Text(
                  'افتح الكاميرا والتقط صورة للنص.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: 141.w,
                  child: OutlinedButton(
                    onPressed: () async {
                      file = await Navigator.push<File>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OcrCameraView(),
                        ),
                      );
                      if (file != null && file is File) {
                        context.read<UploadCubit>().uploadFile(file!);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),

                    child: Text('افتح الكاميرا'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
