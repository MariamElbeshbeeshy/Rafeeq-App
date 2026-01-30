import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/camera_preview.dart';

class QRScanView extends StatefulWidget {
  const QRScanView({super.key});
  static String id = 'QR Scan View';

  @override
  State<QRScanView> createState() => _QRScanViewState();
}

class _QRScanViewState extends State<QRScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: kWhiteBackgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(fit: StackFit.expand, children: [CameraPreview()]),
    );
  }
}
