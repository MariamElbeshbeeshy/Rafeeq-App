import 'package:dio/dio.dart';
import 'dart:io';

class OcrServices {
  final dio = Dio(
    BaseOptions(baseUrl: 'http://10.0.2.2:8000')
    );

  /// upload image/ file to extract text////
   Future<dynamic> uploadFile({required File file , required Function (double progress)onProgress } ) async{
      FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
      ),
    });
    try{
      final response = await dio.post(
        '/ocr',
        data: formData ,
        onSendProgress: (count, total) {
          if(total > 0){
            onProgress(count/total);
          }
        },
      );
    return response.data['text'];

    }
    on DioException catch(e){
      rethrow;
    }
   }

}
