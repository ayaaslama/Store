part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductLoaded extends AddProductState {
  final ProductModel product;

  AddProductLoaded(this.product);
}

final class AddProductFailure extends AddProductState {
  final String errorMessage;

  AddProductFailure(this.errorMessage);
}
