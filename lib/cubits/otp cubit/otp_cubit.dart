import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/cubits/Qr%20cubit/qr_cubit.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';
import 'package:rafeeq_app/services/user_local_services.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  final AuthService authService = AuthService();

  Future<void> otpVerify(String? otpCode) async {
    String? childId = QrCubit.childId;
    String? nationalityId = QrCubit.nationalityId;

    try {
      final AuthResponseModel response = await authService.confirmCode(
        id: childId,
        nationalityId: nationalityId,
        otpCode: otpCode,
      );
      UserLocalServices().saveUserData(response.data);
      emit(OtpVervicationSuccess(response.message));
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"].toString() ?? "Unknown error";
      emit(OtpVervicationError(errorMessage));
    } catch (err) {
      emit(OtpVervicationError("Unexpected Error: $err"));
    }
  }
}
