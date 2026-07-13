part of 'upload_cubit.dart';

@immutable
sealed class UploadState {}

final class UploadInitial extends UploadState {}

final class UploadInProgress extends UploadState {
  final double progress;
  final File file;

  UploadInProgress({required this.progress, required this.file});
}

final class UploadSuccess extends UploadState {
   final String text;
   final File file;
    
  UploadSuccess({required this.text, required this.file});
}

final class UploadFailure extends UploadState {
  final String errorMessage;

  UploadFailure(this.errorMessage);
}
