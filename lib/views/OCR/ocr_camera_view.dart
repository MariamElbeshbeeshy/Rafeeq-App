import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafeeq_app/cubits/camera%20cubit/camera_cubit.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/widgets/ocr_camera_preview.dart';

class OcrCameraView extends StatelessWidget {
  const OcrCameraView({super.key});
  static String id = 'OCR Camera View';
  //final _camerController =

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraCubit()..initCamera(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: BlocConsumer<CameraCubit, CameraState>(
          listener: (context, state) {
            if (state is CameraError) {
              ShowMessage(context, state.message, []);
            }
            if (state is CameraCaptured) {
              File file = File(state.image.path);
              Navigator.pop(context, file);
            }
          },
          builder: (context, state) {
            if (state is CameraLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CameraReady) {
              return OcrCameraPreview();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
