import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/helper/constants.dart';
import 'package:rafeeq_app/models/font_settings_model.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'font_settings_state.dart';

class FontSettingsCubit extends Cubit<FontSettingsState> {
  FontSettingsCubit()
    : super(
        FontSettingsInitial(
          fontSettings: FontSettingsModel(fontSize: 100, fontFamily: 'Cairo'),
        ),
      );

  void changeFontSize(double newSize) {
    final updatedSettings = state.fontSettings.copyWith(fontSize: newSize);
    emit(FontSettingsUpdated(fontSettings: updatedSettings));
  }

  void changeFontFamily(String newFamily) {
    final updatedSettings = state.fontSettings.copyWith(fontFamily: newFamily);
    emit(FontSettingsUpdated(fontSettings: updatedSettings));
  }

  Future<void> updateFontOnBackend() async {
    int fontId =
        kFontToIdMap[state.fontSettings.fontFamily] ?? 1; // 1 هو الـ default
    final Dio dio = Dio();
    try {
      dio.patch(
        "https://api-rafiq.runasp.net/api/v1/UpdateProfile",
        data: {
          "fontType": fontId,
          "fontSize": state.fontSettings.fontSize.toInt(),
        },
        options: Options(
          headers: {
            //"Authorization": "Bearer ${UserLocalServices().getToken()}",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjRhYjk2YjdiLTc3MDQtNGE4Zi04Y2ZmLTI1ZDk3MjI0MjRiMCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiLYo9it2YXYryIsInR5cGVVc2VyIjoiUGFyZW50IiwiZXhwIjoxODE4NjU5NjQzLCJpc3MiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20iLCJhdWQiOiJodHRwOi8vd3d3Lmdvb2dsZS5jb20ifQ.2q-VARy7wsNJqZL8e5UzoZxyDFTuAo94JvCZTKJEbBo",
            "Content-Type": "application/json",
            "accept": "text/plain",
            "Accept-Language": "ar",
          },
        ),
      );
      debugPrint("تم إرسال ID الخط للباك إند: $fontId");
    } catch (e) {
      debugPrint("خطأ في الربط: $e");
    }
  }
}
