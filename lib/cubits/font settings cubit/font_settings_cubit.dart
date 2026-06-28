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
    int fontId = kFontToIdMap[state.fontSettings.fontFamily] ?? 1;
    final Dio dio = Dio();
    try {
      debugPrint("${UserLocalServices().getUserData()?.token}");
      dio.patch(
        "https://api-rafiq.runasp.net/api/v1/UpdateProfile",
        data: {
          "fontType": fontId,
          "fontSize": state.fontSettings.fontSize.toInt(),
        },
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${UserLocalServices().getUserData()?.token}",
          },
        ),
      );
      debugPrint("تم إرسال ID الخط للباك إند: $fontId");
    } on DioException catch (e) {
      debugPrint("خطأ في الربط: ${e.response?.data ?? e.message}");
    } catch (e) {
      debugPrint("خطأ في الربط: $e");
    }
  }
}
