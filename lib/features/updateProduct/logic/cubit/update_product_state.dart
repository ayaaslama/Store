part of 'update_product_cubit.dart';

@immutable
sealed class UpdateProductState {}

final class UpdateProductInitial extends UpdateProductState {}

final class UpdateProductLoading extends UpdateProductState {}

final class UpdateProductLoaded extends UpdateProductState {
  final ProductModel product;
  UpdateProductLoaded(this.product);
}

final class UpdateProductFailure extends UpdateProductState {
  final String errorMessage;
  UpdateProductFailure(this.errorMessage);
}
