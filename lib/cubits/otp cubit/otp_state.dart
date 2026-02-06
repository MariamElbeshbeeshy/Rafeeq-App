part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

class OtpVervicationSuccess extends OtpState {
  final String message;
  OtpVervicationSuccess(this.message);
}

class OtpVervicationError extends OtpState {
  final String message;
  OtpVervicationError(this.message);
}
