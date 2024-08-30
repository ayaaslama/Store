part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {
  final ProductModel product;

  AddProductSuccess(this.product);
}

final class AddProductFailure extends AddProductState {
  final String errorMessage;

  AddProductFailure(this.errorMessage);
}
