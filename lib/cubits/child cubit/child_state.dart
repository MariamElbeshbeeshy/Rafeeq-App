part of 'child_cubit.dart';

@immutable
sealed class ChildState {}

final class ChildInitial extends ChildState {}

final class ChildDataLoaded extends ChildState {
  final UserDataModel childData;

  ChildDataLoaded(this.childData);
}

final class ChildDataError extends ChildState {
  final String errorMessage;

  ChildDataError(this.errorMessage);
}

final class ChildPortfolioLoaded extends ChildState {
  final UserDataModel childData;
  final List<LevelModel> levels;

  ChildPortfolioLoaded(this.childData, this.levels);
}

final class ChildPortfolioError extends ChildState {
  final String errorMessage;

  ChildPortfolioError(this.errorMessage);
}


