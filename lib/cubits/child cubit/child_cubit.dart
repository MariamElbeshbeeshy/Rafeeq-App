import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjRhYjk2YjdiLTc3MDQtNGE4Zi04Y2ZmLTI1ZDk3MjI0MjRiMCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLYo9it2YXYryIsInR5cGVVc2VyIjoiUGFyZW50IiwiZXhwIjoxODE4NjU5NjQzLCJpc3MiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20iLCJhdWQiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20ifQ.2q-VARy7wsNJqZL8e5UzoZxyDFTuAo94JvCZTKJEbBo",
            //"Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final UserDataModel? childData = await UserLocalServices()
            .updateUserData(response.data!["data"]);
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
            //"Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjRhYjk2YjdiLTc3MDQtNGE4Zi04Y2ZmLTI1ZDk3MjI0MjRiMCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLYo9it2YXYryIsInR5cGVVc2VyIjoiUGFyZW50IiwiZXhwIjoxODE4NjU5NjQzLCJpc3MiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20iLCJhdWQiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20ifQ.2q-VARy7wsNJqZL8e5UzoZxyDFTuAo94JvCZTKJEbBo",
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
