part of 'library_cubit.dart';

@immutable
sealed class LibraryState {}

final class LibraryInitial extends LibraryState {}

final class LibraryLoading extends LibraryState {}

final class LibraryUpdated extends LibraryState {
  final String message;
  LibraryUpdated(this.message);
}

final class LibraryLoaded extends LibraryState {
  final List<dynamic> libraryItems;

  LibraryLoaded(this.libraryItems);
}

final class LibraryError extends LibraryState {
  final String message;

  LibraryError(this.message);
}
