import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService = AuthService();
  LoginCubit() : super(LoginInitial());
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
      emit(LoginSuccess(response.message));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(LoginError(errorMessage));
    } catch (err) {
      emit(LoginError("Unexpected Error: $err"));
    }
  }
}
