import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:rafeeq_app/cubits/Qr%20cubit/qr_cubit.dart';
import 'package:rafeeq_app/helper/show_alert_dialog.dart';
import 'package:rafeeq_app/views/login_view.dart';
import 'package:rafeeq_app/views/otp_view.dart';

class QRCameraPreview extends StatefulWidget {
  const QRCameraPreview({super.key});

  @override
  State<QRCameraPreview> createState() => _QRCameraPreviewState();
}

class _QRCameraPreviewState extends State<QRCameraPreview> {
  final MobileScannerController scannerController = MobileScannerController(
    detectionTimeoutMs: 1000,
  );
  String? loginData;
  String? childId;

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrCubit, QrState>(
      listener: (context, state) {
        if (state is QrSuccess) {
          ShowMessage(context, state.message, [
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                OtpView.id,
                (Route<dynamic> route) => route.settings.name == LoginView.id,
                arguments: childId,
              ),
              child: Text("التالي"),
            ),
          ]);
        } else if (state is QrError) {
          ShowMessage(context, state.message, []);
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
            debugPrint(result.barcodes.first.rawValue);
            await BlocProvider.of<QrCubit>(context).qrScanLogin(qrRawData);
          },
        ),
      ),
    );
  }
}
