part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({required this.homeModel});

  final HomeDataModel homeModel;
}

class HomeError extends HomeState {
  HomeError({required this.message});

  final String message;
}
