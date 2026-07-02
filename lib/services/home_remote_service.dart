import 'package:dio/dio.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

import '../models/HomeModel/home_model.dart';

class HomeRemoteService {
  UserDataModel? userInfo = UserLocalServices().getUserData();
  final dio = Dio(BaseOptions(baseUrl: 'https://api-rafiq.runasp.net/api/v1'));

  Future<dynamic> getHomeInfo() async {
    try {
      // final response = await dio.get(
      //   '/Home',
      //   options: Options(
      //     headers: {'Authorization': 'Bearer ${userInfo!.token}'},
      //   ),
      // );
      return HomeModel.fromJson( {
  "statusCode": 200,
  "key": "success",
  "message": null,
  "data": {
    "headerInfo": {
      "currentLevelId": 2,
      "points": 0
    },
    "streakInfo": [
      {
        "date": "2026-06-27T00:00:00+02:00",
        "dayName": "Sat",
        "isCompleted": true,
        "isToday": false
      },
      {
        "date": "2026-06-28T00:00:00+02:00",
        "dayName": "Sun",
        "isCompleted": false,
        "isToday": false
      },
      {
        "date": "2026-06-29T00:00:00+02:00",
        "dayName": "Mon",
        "isCompleted": true,
        "isToday": false
      },
      {
        "date": "2026-06-30T00:00:00+02:00",
        "dayName": "Tue",
        "isCompleted": false,
        "isToday": false
      },
      {
        "date": "2026-07-01T00:00:00+02:00",
        "dayName": "Wed",
        "isCompleted": false,
        "isToday": false
      },
      {
        "date": "2026-07-02T00:00:00+02:00",
        "dayName": "Thu",
        "isCompleted": false,
        "isToday": true
      },
      {
        "date": "2026-07-03T00:00:00+02:00",
        "dayName": "Fri",
        "isCompleted": false,
        "isToday": false
      }
    ],
    "levelsList": [
      {
        "id": 1,
        "title": "المستوى الأول",
        "description": "القراءة",
        "status": 1,
        "completionPercentage": 10
      },
      {
        "id": 2,
        "title": "المستوى الثاني",
        "description": "الفهم القرائي",
        "status": 2,
        "completionPercentage": 55
      },
      {
        "id": 3,
        "title": "المستوى الثالث",
        "description": "الانتباه البصري",
        "status": 1,
        "completionPercentage": 0
      },
      {
        "id": 4,
        "title": "المستوى الرابع",
        "description": "الخلط بين الحروف",
        "status": 1,
        "completionPercentage": 0
      },
      {
        "id": 5,
        "title": "المستوى الخامس",
        "description": "الإملاء",
        "status": 1,
        "completionPercentage": 0
      }
    ]
  }
});
    } on DioException {
      rethrow;
    }
  }
}
