import 'package:dio/dio.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

import '../models/HomeModel/home_model.dart';

class HomeRemoteService {
  final dio = Dio(BaseOptions(baseUrl: 'https://api-rafiq.runasp.net/api/v1'));

  Future<HomeModel> getHomeInfo() async {
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
        return HomeModel.fromJson(response.data);
      }
      throw Exception('تعذر الحصول على بيانات الصفحة الرئيسية');
    } on DioException {
      rethrow;
    }
  }
}
