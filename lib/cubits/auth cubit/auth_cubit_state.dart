part of 'qr_cubit.dart';

@immutable
sealed class QRCubitState {}

final class QRCubitInitial extends QRCubitState {}

class AuthInitial extends QRCubitState {}

class QrScanSuccess extends QRCubitState {
  final String message;
  QrScanSuccess(this.message);
}

class QrScanError extends QRCubitState {
  final String message;
  QrScanError(this.message);
}


