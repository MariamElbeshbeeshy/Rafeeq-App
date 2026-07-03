import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/Library/library_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit() : super(LibraryInitial());

  String baseUrl = "https://api-rafiq.runasp.net/api/v1";
  final Dio dio = Dio();

  getLibraryItems() async {
    try {
      Response response = await dio.get(
        '$baseUrl/library',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYzNDJkMjg3LTllNmYtNDBlNy1hNjA5LTI3NzE4ZjA0M2U5ZiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLZitin2LPZitmGIiwidHlwZVVzZXIiOiJQYXJlbnQiLCJleHAiOjE4MTg2MTM1MTAsImlzcyI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSIsImF1ZCI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSJ9.tlSWVkfu8i87ZKrHrK1AV9e7nAQseoTLK7k3WFHypuk",
            //"Authorization": "Bearer ${UserLocalServices().getUserData()?.token}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> responseData =
            response.data['data'] as List<dynamic>;
        List<LibraryItemModel> libraryItems = responseData
            .map(
              (questionJson) =>
                  LibraryItemModel.fromJson(response.data["data"]),
            )
            .toList();
        emit(LibraryLoaded(libraryItems));
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data ?? e.message);
      emit(LibraryError("حدث خطأ أثناء جلب البيانات"));
    }
  }

  addLibraryItem(String questionID) async {
    try {
      Response response = await dio.post(
        '$baseUrl/library/$questionID',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYzNDJkMjg3LTllNmYtNDBlNy1hNjA5LTI3NzE4ZjA0M2U5ZiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLZitin2LPZitmGIiwidHlwZVVzZXIiOiJQYXJlbnQiLCJleHAiOjE4MTg2MTM1MTAsImlzcyI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSIsImF1ZCI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSJ9.tlSWVkfu8i87ZKrHrK1AV9e7nAQseoTLK7k3WFHypuk",
            //"Authorization": "Bearer ${UserLocalServices().getUserData()?.token}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(LibraryUpdated());
      }
    } on DioException catch (e) {
      debugPrint(e.response?.data ?? e.message);
      emit(LibraryError("${e.message}"));
    }
  }

  deleteLibraryItem(String questionID) async {
    try {
      Response response = await dio.delete(
        '$baseUrl/library/$questionID',
        options: Options(
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYzNDJkMjg3LTllNmYtNDBlNy1hNjA5LTI3NzE4ZjA0M2U5ZiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLZitin2LPZitmGIiwidHlwZVVzZXIiOiJQYXJlbnQiLCJleHAiOjE4MTg2MTM1MTAsImlzcyI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSIsImF1ZCI6Imh0dHA6Ly93d3cuZ29vZ2xlLmNvbSJ9.tlSWVkfu8i87ZKrHrK1AV9e7nAQseoTLK7k3WFHypuk",
            //"Authorization": "Bearer ${UserLocalServices().getUserData()?.token}",
            "Accept-Language": "ar",
          },
        ),
      );
      if (response.statusCode == 200) {
        emit(LibraryUpdated());
      }
    } on DioException catch (e) {
      debugPrint(e.message);
      emit(LibraryError("${e.message}"));
    }
  }
}
