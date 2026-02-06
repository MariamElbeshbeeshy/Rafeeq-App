import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  final AuthService authService = AuthService();

  Future<void> otpVerify(String? qrRawData) async {
    String? childId;

    try {
      final Response response = await authService.confirmCode(
        id: childId,
        nationalityId: "",
        otpCode: "1234"
      );
      emit(OtpVervicationSuccess(response.data["message"]));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(OtpVervicationError(errorMessage));
    } catch (err) {
      emit(OtpVervicationError("Unexpected Error: $err"));
    }
  }
}
