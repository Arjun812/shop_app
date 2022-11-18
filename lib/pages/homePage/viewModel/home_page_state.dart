part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final ProductModel? model;

  HomePageLoaded({this.model});
}

class HomePageError extends HomePageState {
  final String? error;

  HomePageError(this.error);
}

