import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<UploadCubit, UploadState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state is UploadInProgress)
              UploadTile(
                progress: state.progress,
                file: state.file,
                isButtonEnabled: false,
              )
            else if (state is UploadSuccess)
              UploadTile(progress: 1.0, file: state.file, isButtonEnabled: true , text: state.text)
            else if (state is UploadFailure)
              Text(
                "فشل الرفع: ${state.errorMessage}",
                style: TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}
