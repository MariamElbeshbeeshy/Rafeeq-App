import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraPreview extends StatelessWidget {
  const CameraPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: MobileScanner(
        fit: BoxFit.cover,
        tapToFocus: true,
        onDetect: (result) {
          debugPrint(result.barcodes.first.rawValue);
        },
      ),
    );
  }
}