part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<String> categories;

  CategoriesLoaded(this.categories);
}

final class CategoriesError extends CategoriesState {
  final String errorMessage;

  CategoriesError(this.errorMessage);
}
