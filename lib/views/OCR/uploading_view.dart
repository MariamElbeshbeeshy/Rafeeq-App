import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafeeq_app/cubits/upload%20cubit/upload_cubit.dart';
import 'package:rafeeq_app/widgets/upload_tile.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is UploadSuccess) {
          isButtonEnabled = true;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              // Text(widget.file.path.split('/').last),
              if (state is UploadInProgress)
                UploadTile(progress: state.progress, file: state.file,)
              else if (state is UploadSuccess)
                UploadTile(progress: 1.0, file: state.file,)
              else if (state is UploadFailure)
                Text(
                  "فشل الرفع: ${state.errorMessage}",
                  style: TextStyle(color: Colors.red),
                ),

              Row(
                children: [
                  SizedBox(
                    width: 94.w,
                    child: ElevatedButton(
                      onPressed: () => isButtonEnabled ? () {} : null,
                      child: Text("استمرار"),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  SizedBox(
                    width: 94.w,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("إلغاء"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
