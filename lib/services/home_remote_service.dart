import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

import '../models/HomeModel/home_model.dart';

class HomeRemoteService {
  final dio = Dio(BaseOptions(baseUrl: 'https://api-rafiq.runasp.net/api/v1'));

  Future<dynamic> getHomeInfo() async {
    try {
      final response = await dio.get(
        '/Home',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${UserLocalServices().getToken()}',
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        HomeModel.fromJson(response.data["data"]);
      }
    } on DioException {
      rethrow;
    }
  }
}
