import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadTile extends StatelessWidget {
  final double progress;
  final File file;
  final bool isButtonEnabled;
  const UploadTile({
    super.key,
    required this.progress,
    required this.file,
    required this.isButtonEnabled,
  });

  @override
  Widget build(BuildContext context) {
    String fileName = file.path.split('/').last;
    String fileSize = (file.lengthSync() / (1024 * 1024)).toStringAsFixed(2);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // الصف الأول: الأيقونة، الاسم، وزر الإغلاق
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.image, color: Colors.amber, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      fileName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    " ($fileSize MB)",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal, // الحجم عادي
                      fontSize: 13,
                      color: Colors.grey, // لون رمادي أهدى
                    ),
                  ),
                  const Icon(Icons.close, color: Colors.amber, size: 20),
                ],
              ),
              const SizedBox(height: 12),
              // الصف الثاني: شريط التحميل والنسبة
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: progress, // هنا بنمرر القيمة من الـ Cubit
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.amber,
                      ),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${(progress * 100).toInt()}%",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SizedBox(
              width: 94.w,
              child: ElevatedButton(
                onPressed: () => isButtonEnabled ? () {} : null,
                child: Text("استمر"),
              ),
            ),
            SizedBox(width: 16.w),
            SizedBox(
              width: 94.w,
              child: OutlinedButton(onPressed: () {}, child: Text("إلغاء")),
            ),
          ],
        ),
      ],
    );
  }
}
