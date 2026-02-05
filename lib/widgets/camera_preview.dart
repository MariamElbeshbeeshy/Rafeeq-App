import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';
import 'package:rafeeq_app/services/login_services.dart';

class CameraPreview extends StatefulWidget {
  const CameraPreview({super.key});

  @override
  State<CameraPreview> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreview> {
  String? qrID;
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: MobileScanner(
        fit: BoxFit.cover,
        tapToFocus: true,
        onDetect: (result) async {
          qrID = result.barcodes.first.rawValue;
          debugPrint(result.barcodes.first.rawValue);
          AuthResponseModel response = await authService.logIn(
            id: qrID,
            deviceId: "11-22-33",
            deviceName: "Android",
            projectName: "Rafiq",
          );
          if (response.key == "fail") {
            ShowMessage(context, '❌', response.message, []);
          } else {
            ShowMessage(context, '✅', response.message, [
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
          }
        },
      ),
    );
  }
}
