import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rafeeq_app/cubits/auth%20cubit/qr_cubit.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';

class CameraPreview extends StatefulWidget {
  const CameraPreview({super.key});

  @override
  State<CameraPreview> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreview> {
  final MobileScannerController scannerController = MobileScannerController(
    detectionTimeoutMs: 1000,
  );
  String? qrData;
  late String childId;
  AuthService authService = AuthService();

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QRCubit, QRCubitState>(
      listener: (context, state) {
        if (state is QrScanSuccess) {
          ShowMessage(context, '✅', state.message, [
            // TextButton(
            //   onPressed: () =>
            //       Navigator.pushNamedAndRemoveUntil(
            //         context,
            //         ProductDetailsScreen.id,
            //         (Route<dynamic> route) =>
            //             route.settings.name == HomeScreen.id,
            //         arguments: addedProduct,
            //       ),
            //   child: Text('Show'),
            // ),
          ]);
        } else if (state is QrScanError) {
          ShowMessage(context, '❌', state.message, []);
        }
      },
      child: Transform.scale(
        scale: 1.5,
        child: MobileScanner(
          controller: scannerController,
          fit: BoxFit.cover,
          tapToFocus: true,
          onDetect: (result) async {
            final String? qrRawData = result.barcodes.first.rawValue;
            await BlocProvider.of<QRCubit>(context).qrScanLogin(qrRawData);
          },
        ),
      ),
    );
  }
}

//   Future<void> sendQRcode(BarcodeCapture result, BuildContext context) async {
//
//     if (qrRawData != null) {
//       Map<String, dynamic> qrMappedData = jsonDecode(qrRawData);
//       childId = qrMappedData["child_id"];
//     }
//     debugPrint(result.barcodes.first.rawValue);
//     debugPrint(childId);
//     AuthResponseModel response = await authService.logIn(
//       id: childId,
//       deviceId: "11-22-33",
//       deviceName: "Android",
//       projectName: "Rafiq",
//     );
//     if (response.key == "fail") {
//       ShowMessage(context, '❌', response.message, []);
//     } else {
//       ShowMessage(context, '✅', response.message, [
//         // TextButton(
//         //   onPressed: () =>
//         //       Navigator.pushNamedAndRemoveUntil(
//         //         context,
//         //         ProductDetailsScreen.id,
//         //         (Route<dynamic> route) =>
//         //             route.settings.name == HomeScreen.id,
//         //         arguments: addedProduct,
//         //       ),
//         //   child: Text('Show'),
//         // ),
//       ]);
//     }
//   }
// }
