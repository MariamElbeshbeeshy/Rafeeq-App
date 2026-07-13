import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/services/ocr_services.dart';

part 'upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInitial());
   final ocrServices = OcrServices();
   

  Future<void> uploadFile(File file) async {
    try {
      
      final response = await ocrServices.uploadFile(
       file: file , 
        onProgress : (progress){
          emit(UploadInProgress(progress: progress , file: file));
           }
      );
     print("hii response:$response");
      emit(UploadSuccess(text: response , file: file));
    } catch (e) {
      emit(UploadFailure("فشل الرفع: ${e.toString()}"));
    }
  }
}
