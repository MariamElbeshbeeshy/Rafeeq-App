// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
// import 'package:rafeeq_app/helper/constants.dart';
// import 'package:rafeeq_app/widgets/camera_preview.dart';
// import 'package:rafeeq_app/widgets/custom_camera_button.dart';

// class QRScanView extends StatefulWidget {
//   const QRScanView({super.key});
//   static String id = 'QR Scan View';

//   @override
//   State<QRScanView> createState() => _QRScanViewState();
// }

// class _QRScanViewState extends State<QRScanView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,

//       backgroundColor: Colors.black,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           CameraPreview(),
//           QRScannerOverlay(
//             overlayColor: const Color.fromARGB(183, 0, 0, 0),
//             scanAreaSize: Size(295.w, 385.h),
//             borderColor: kPrimaryColor,
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Spacer(flex: 1),
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: Icon(Icons.arrow_back_ios),
//                       padding: EdgeInsets.only(right: 8.w),
//                       alignment: Alignment.center,
//                       iconSize: 20.w,
//                       color: kWhiteBackgroundColor,
//                     ),
//                     Text(
//                       'امسح رمز الـ QR ',
//                       style: TextStyle(
//                         color: kWhiteBackgroundColor,
//                         fontSize: 30.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 16.w,
//                     vertical: 8.h,
//                   ),
//                   child: Text(
//                     "وجه الكاميرا نحو رمز ال QR الموجود علي الموقع",
//                     style: TextStyle(color: kWhiteBackgroundColor),
//                   ),
//                 ),
//                 Spacer(flex: 10),
//                 CustomCameraButton(onPressed: () {}),
//                 Spacer(flex: 1),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
