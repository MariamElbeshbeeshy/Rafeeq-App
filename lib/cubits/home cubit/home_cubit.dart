import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/HomeModel/home_model.dart';
import 'package:rafeeq_app/services/home_local_services.dart';
import 'package:rafeeq_app/services/home_remote_service.dart';

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
      final cachedData = await _localService.getHomeData();
      if (cachedData != null) {
        emit(HomeSuccess(homeModel: cachedData));
      }

      final remoteData = await _remoteService.getHomeInfo();
      await _localService.saveHomeData(remoteData);
      emit(HomeSuccess(homeModel: remoteData));
    } on DioException catch (e) {
      final cachedData = await _localService.getHomeData();
      if (cachedData != null) {
        emit(HomeSuccess(homeModel: cachedData));
        return;
      }

      emit(HomeError(message: e.message ?? 'تعذر تحميل البيانات الآن'));
    } catch (e) {
      final cachedData = await _localService.getHomeData();
      if (cachedData != null) {
        emit(HomeSuccess(homeModel: cachedData));
        return;
      }

      emit(HomeError(message: 'حدث خطأ غير متوقع'));
    }
  }
}
