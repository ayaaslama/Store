import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/services/add_product.dart';
import 'package:store_app/features/models/product_model.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProduct addProductService;

  AddProductCubit(this.addProductService) : super(AddProductInitial());

  String? title, price, description, image, category;

  Future<void> addProduct() async {
    if (title != null &&
        price != null &&
        description != null &&
        image != null &&
        category != null) {
      try {
        emit(AddProductLoading());
        final product = await addProductService.addProduct(
          title: title!,
          price: price!,
          description: description!,
          image: image!,
          category: category!,
        );
        emit(AddProductSuccess(product));
      } catch (e) {
        emit(AddProductFailure(e.toString()));
      }
    } else {
      emit(AddProductFailure('All fields are required'));
    }
  }
}
