import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/level_model.dart';
import 'package:rafeeq_app/models/user_data_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'child_state.dart';

class ChildCubit extends Cubit<ChildState> {
  ChildCubit() : super(ChildInitial());
  final String baseUrl = "https://api-rafiq.runasp.net/api/v1";
  final Dio dio = Dio();

  Future<void> getChildData() async {
    try {
      final response = await dio.get(
        "$baseUrl/Profile",
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final UserDataModel? childData = await UserLocalServices()
            .updateUserData(response.data!["data"]);
        debugPrint("Child Data: ${childData?.toString()}");
        emit(ChildDataLoaded(childData!));
      }
    } on DioException catch (e) {
      emit(ChildDataError("${e.message}"));
    }
  }

  Future<void> getChildPortfolio() async {
    try {
      final response = await dio.get(
        "$baseUrl/Portfolio",
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Content-Type": "application/json",
            "accept": "text/plain",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final UserDataModel? childData = await UserLocalServices()
            .updateUserData(response.data!["data"]["profile"]);
        final List<LevelModel> levels = (response.data!["data"]["map"] as List)
            .map((levelJson) => LevelModel.fromJson(levelJson))
            .toList();
        emit(ChildPortfolioLoaded(childData!, levels));
      }
    } on DioException catch (e) {
      emit(ChildPortfolioError("${e.message}"));
    }
  }
}
