import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:rafeeq_app/models/auth_response_model.dart';
import 'package:rafeeq_app/services/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final AuthService authService = AuthService();
  AuthResponseModel? authLogInResponse;
  static String? nationalityId;

  Future<void> nationalIdLogin({required String nationalId}) async {
    nationalityId = nationalId;
    emit(LoginLoading());
    try {
      authLogInResponse = await authService.nationalIdLogIn(
        nationalityId: nationalId,
        deviceId: "123",
        deviceType: 1,
      );
      if (authLogInResponse!.key == "success") {
        emit(LoginSuccess(message: authLogInResponse!.message));
      }
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["message"];
      emit(LoginFailure(errorMessage: errorMessage));
    } catch (e) {
      emit(LoginFailure(errorMessage: "خطأ غير متوقع ${e.toString()}"));
    }
  }
}
