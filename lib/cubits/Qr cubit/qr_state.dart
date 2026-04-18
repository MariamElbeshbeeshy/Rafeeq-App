part of 'qr_cubit.dart';

@immutable
sealed class QrState {}

class QrInitial extends QrState {}

class QrSuccess extends QrState {
  final String message;
  QrSuccess(this.message);
}

class QrError extends QrState {
  final String message;
  QrError(this.message);
}


