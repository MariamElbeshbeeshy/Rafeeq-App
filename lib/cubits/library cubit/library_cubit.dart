import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/Library/library_model.dart';
import 'package:rafeeq_app/services/library_data_services.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitial());

  String baseUrl = "https://api-rafiq.runasp.net/api/v1";
  final Dio dio = Dio();

  Future<void> getLibraryItems() async {
    emit(LibraryLoading());
    final List<LibraryItemModel>? cachedData = await LibraryLocalService()
        .getCachedLibraryList();

    try {
      debugPrint("${UserLocalServices().getToken}");
      Response response = await dio.get(
        '$baseUrl/library',
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocalServices().getToken()}",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final responseData = response.data['data'];
        List<LibraryItemModel> libraryItems = responseData
            .map(
              (questionJson) => LibraryItemModel.fromJson(
                questionJson as Map<String, dynamic>,
              ),
            )
            .toList()
            .cast<LibraryItemModel>();
        await LibraryLocalService().saveLibraryList(libraryItems);
        emit(LibraryLoaded(libraryItems));
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data ?? e.message);
      if (cachedData != null) {
        emit(LibraryLoaded(cachedData));
      } else {
        emit(LibraryError("حدث خطأ أثناء جلب البيانات"));
      }
    } catch (e) {
      if (cachedData != null) {
        emit(LibraryLoaded(cachedData));
      } else {
        emit(LibraryError("حدث خطأ أثناء جلب البيانات"));
      }
    }
  }

  Future<void> addLibraryItem(String questionID) async {
    try {
      Response response = await dio.post(
        '$baseUrl/library/$questionID',
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(LibraryUpdated("تم حفظ السؤال في مكتبتك"));
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data ?? e.message);
      emit(LibraryError("${e.message}"));
    }
  }

  Future<void> deleteLibraryItem(String questionID) async {
    try {
      Response response = await dio.delete(
        '$baseUrl/library/$questionID',
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(LibraryUpdated("تم حذف السؤال من مكتبتك"));
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      emit(LibraryError("${e.response!.data["message"]}"));
    }
  }
}
