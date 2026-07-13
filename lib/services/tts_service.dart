import 'package:dio/dio.dart';
import 'dart:io';

import 'package:rafeeq_app/services/user_local_services.dart';

class TtsService {
  final dio = Dio(BaseOptions(baseUrl: 'https://api-rafiq.runasp.net/api/v1'));

  Future<dynamic> generateAudio({required String text}) async {
    try {
      print("before request");
      final response = await dio.post(
        '/audio/generate',
        data: {"text": text, "speaker": "Salem", "dialect": "msa"},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${UserLocalServices().getToken()}',
          },
          responseType: ResponseType.bytes,
        ),
      );
      print("after request");
      print(response.statusCode);
      print(response.data.runtimeType);
      print(response.headers.value("content-type"));
      print((response.data as List<int>).length);
      //print(response);
      return response.data; // list<int> represent butes of audio
    } on DioException catch (e) {
      print(e.message);

      print(e.response?.statusCode);

      print(e.response?.headers);

      print(e.response?.data);
      throw Exception(e.error);
    }
  }
}
