import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:rafeeq_app/cubits/camera%20cubit/camera_cubit.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/custom_camera_button.dart';

class OcrCameraPreview extends StatelessWidget {
  const OcrCameraPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(context.read<CameraCubit>().cameraController!),
        QRScannerOverlay(
          overlayColor: const Color.fromARGB(183, 0, 0, 0),
          scanAreaSize: Size(343.w, 610.h),
          borderColor: kPrimaryColor,
        ),
        Positioned(
          bottom: 0.h,
          left: 139.w,
          right: 139.w,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: CustomCameraButton(onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
