import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'qr_state.dart';

class QrCubit extends Cubit<QrState> {
  final AuthService authService = AuthService();
  QrCubit() : super(QrInitial());
  static String? childId;
  static String? nationalityId= "3032158777";
  //static String? nationalityId = "3032158777";

  Future<void> qrScanLogin(String? qrRawData) async {
    if (qrRawData != null) {
      Map<String, dynamic> qrMappedData = jsonDecode(qrRawData);
      childId = qrMappedData["child_id"];
    }
    try {
      final AuthResponseModel response = await authService.logIn(
        //id: childId,
        id: childId,
        deviceId: "11-22-33",
        deviceName: "Android",
        projectName: "Rafiq",
      );
      emit(QrSuccess(response.message));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(QrError(errorMessage));
    } catch (err) {
      emit(QrError("Unexpected Error: $err"));
    }
  }
}
