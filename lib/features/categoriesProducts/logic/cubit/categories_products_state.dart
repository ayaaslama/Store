part of 'categories_products_cubit.dart';

@immutable
abstract class CategoriesProductsState {}

final class CategoriesProductsInitial extends CategoriesProductsState {}

final class CategoriesProductsLoading extends CategoriesProductsState {}

final class CategoriesProductsLoaded extends CategoriesProductsState {
  final List<ProductModel> products;
  CategoriesProductsLoaded(this.products);
}

final class CategoriesProductsFailure extends CategoriesProductsState {
  final String errorMessage;
  CategoriesProductsFailure(this.errorMessage);
}
