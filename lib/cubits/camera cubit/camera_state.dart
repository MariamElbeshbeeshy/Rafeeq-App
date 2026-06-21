part of 'camera_cubit.dart';

@immutable
sealed class CameraState {}

final class CameraInitial extends CameraState {}

final class CameraLoading extends CameraState {}

final class CameraReady extends CameraState {}

final class CameraError extends CameraState {
  final String message;
  CameraError(this.message);
}

final class CameraCaptured extends CameraState {
  final XFile image;
  CameraCaptured(this.image);
}
