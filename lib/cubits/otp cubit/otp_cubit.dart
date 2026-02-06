import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  final AuthService authService = AuthService();

  Future<void> otpVerify(String? otpCode) async {
    String? childId = "5a8c2607-dc69-4131-9662-4078a30ecb1b";
    String? nationalityId = "3032158777";
    
    try {
      final AuthResponseModel response = await authService.confirmCode(
        id: childId,
        nationalityId: nationalityId,
        otpCode: otpCode,
      );
      emit(OtpVervicationSuccess(response.message));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(OtpVervicationError(errorMessage));
    } catch (err) {
      emit(OtpVervicationError("Unexpected Error: $err"));
    }
  }
}
