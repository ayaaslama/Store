part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<ProductModel> products;

  HomeLoaded(this.products);
}

final class HomeFailure extends HomeState {
  final String errorMessage;

  HomeFailure(this.errorMessage);
}
