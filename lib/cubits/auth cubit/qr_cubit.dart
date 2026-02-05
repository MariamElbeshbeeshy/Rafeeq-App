import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'auth_cubit_state.dart';

class QRCubit extends Cubit<QRCubitState> {
  final AuthService authService = AuthService();
  QRCubit() : super(QRCubitInitial());

  Future<void> qrScanLogin(String? qrRawData) async {
    String? childId;
    if (qrRawData != null) {
      Map<String, dynamic> qrMappedData = jsonDecode(qrRawData);
      childId = qrMappedData["child_id"];
    }
    try {
      final Response response = await authService.logIn(
        id: childId,
        deviceId: "11-22-33",
        deviceName: "Android",
        projectName: "Rafiq",
      );
      emit(QrScanSuccess(response.data["message"]));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(QrScanError(errorMessage));
    } catch (err) {
      emit(QrScanError("Unexpected Error: $err"));
    }
  }
}
