import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';
import 'package:rafeeq_app/services/home_local_services.dart';
import 'package:rafeeq_app/services/home_remote_service.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({HomeRemoteService? remoteService, HomeLocalServices? localService})
    : _remoteService = remoteService ?? HomeRemoteService(),
      _localService = localService ?? HomeLocalServices(),
      super(HomeInitial());

  final HomeRemoteService _remoteService;
  final HomeLocalServices _localService;

  Future<void> loadHomeData() async {
    final cachedData = await _localService.getHomeData();

    if (cachedData != null) {
      emit(HomeSuccess(homeModel: cachedData));
    } else {
      emit(HomeLoading());
    }
    try {
      final remoteData = await _remoteService.getHomeInfo();
      await _localService.saveHomeData(remoteData);
      emit(HomeSuccess(homeModel: remoteData));
    } on DioException catch (e) {
      if (cachedData == null) {
        emit(HomeError(message: e.message ?? 'تعذر تحميل البيانات الآن'));
      }
      emit(HomeError(message: e.message ?? 'تعذر تحميل البيانات الآن'));
    } catch (e) {
      if (cachedData == null) {
        emit(HomeError(message: 'حدث خطأ غير متوقع'));
      }
    }
  }
}

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());

//   final dio = Dio(BaseOptions(baseUrl: 'https://api-rafiq.runasp.net/api/v1'));

//   Future<dynamic> getHomeData() async {
//     try {
//       final response = await dio.get(
//         '/Home',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer ${UserLocalServices().getToken()}',
//           },
//         ),
//       );
//       if (response.statusCode == 200 && response.data != null) {
//         HomeDataModel homeData = HomeDataModel.fromJson(response.data["data"]);
//         emit(HomeSuccess(homeModel: homeData));
//       }
//     } on DioException catch (e) {
//       emit(
//         HomeError(
//           message:
//               "${e.response?.data['message'] ?? "حدث خطأ عند فتح المستوى، حاول مرة أخرى."}",
//         ),
//       );
//     }
//   }
// }
