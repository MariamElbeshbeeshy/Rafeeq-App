// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:rafeeq_app/helper/show_alert_dialog.dart';
// import 'package:rafeeq_app/models/auth_response_model.dart';
// import 'package:rafeeq_app/services/auth_service.dart';

// class CameraPreview extends StatefulWidget {
//   const CameraPreview({super.key});

//   @override
//   State<CameraPreview> createState() => _CameraPreviewState();
// }

// class _CameraPreviewState extends State<CameraPreview> {
//   String? qrData;
//   late String childId;
//   AuthService authService = AuthService();
//   @override
//   Widget build(BuildContext context) {
//     return Transform.scale(
//       scale: 1.5,
//       child: MobileScanner(
//         fit: BoxFit.cover,
//         tapToFocus: true,
//         onDetect: (result) async {
//           await sendQRcode(result, context);
//         },
//       ),
//     );
//   }

//   Future<void> sendQRcode(BarcodeCapture result, BuildContext context) async {
//     final String? qrRawData = result.barcodes.first.rawValue;
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
