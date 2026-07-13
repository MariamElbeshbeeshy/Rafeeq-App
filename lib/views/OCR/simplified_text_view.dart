import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/widgets/tts_audio_player.dart';

class SimplifiedContentView extends StatelessWidget {
  final String? text;
  const SimplifiedContentView({super.key, this.text});
  static String id = "SimplifiedContentView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "المحتوى المبسط",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  margin: EdgeInsets.only(bottom: 16.h),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            text ?? 'حدث خطأ',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              height: 2,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                      TTSAudioPlayer(text :'audio/reading.mp3'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
