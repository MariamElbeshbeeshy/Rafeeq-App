import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());

  Future<void> uploadFile(File file) async {
    try {
      emit(UploadInProgress(progress: 0.0, file: file));

      // Simulate Upload Progress
      Future.delayed(Duration(seconds: 2)); // Simulate upload delay
      emit(UploadInProgress(progress: 0.5, file: file));

      Future.delayed(Duration(seconds: 3)); // Simulate upload delay
      emit(UploadInProgress(progress: 1.0, file: file));

      //Upload logic here
      // await Dio().post(
      //   "YOUR_API_URL",
      //   data: FormData.fromMap({"file": await MultipartFile.fromFile(file.path)}),
      //   onSendProgress: (sent, total) {
      //     double progress = sent / total;
      //     emit(UploadInProgress(progress: progress, file: file)); // تحديث الـ UI بنسبة الرفع
      //   },
      // );

      emit(UploadSuccess(file: file));
    } catch (e) {
      emit(UploadFailure("فشل الرفع: ${e.toString()}"));
    }
  }
}
