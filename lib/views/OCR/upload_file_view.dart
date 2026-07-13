import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/upload%20cubit/upload_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/views/OCR/uploading_view.dart';

class UploadFileView extends StatefulWidget {
  const UploadFileView({super.key});

  @override
  State<UploadFileView> createState() => _UploadFileViewState();
}

class _UploadFileViewState extends State<UploadFileView>
    with AutomaticKeepAliveClientMixin<UploadFileView> {
  @override
  bool get wantKeepAlive => true;

  File? file;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      children: [
        /// upload container ///
        Container(
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
                mainAxisSize: MainAxisSize.min,
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
                    'اختر ملفا أو اسحبه وأفلته هنا.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: 141.w,
                    child: OutlinedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.pickFiles();
                        if (result != null) {
                          file = File(result.files.single.path!);
                          context.read<UploadCubit>().uploadFile(
                            file!,
                          ); // تم استدعاء الرفع!
                        }
                        // FilePickerResult? result =
                        //     await FilePicker.pickFiles(
                        //       onFileLoading: (FilePickerStatus status) =>
                        //       setState(() {
                        //         loading = FilePickerStatus.values;
                        //       }) ,
                        //     );

                        // if (result != null) {
                        //   setState(() {
                        //     file = File(result.files.single.name!);
                        //   });
                        // } else {
                        //   // User canceled the picker
                        // }
                        // setState(() {
                        //   counter++;
                        // });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),

                      child: Text('تصفح الملفات'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 32.h),
        UploadScreen(),
      ],
    );
  }
}
