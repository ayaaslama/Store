import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/services/update_product.dart';
import 'package:store_app/features/models/product_model.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  final UpdateProductService updateProductService;
  UpdateProductCubit(this.updateProductService) : super(UpdateProductInitial());
  String? title, price, description, image, category;
  int? id;
  Future<void> updateProduct() async {
    emit(UpdateProductLoading());
    if (title != null &&
        id != null &&
        price != null &&
        description != null &&
        image != null &&
        category != null) {
      try {
        final product = await updateProductService.updateProduct(
            id: id!,
            title: title!,
            price: price!,
            desc: description!,
            image: image!,
            category: category!);
        emit(UpdateProductLoaded(product));
      } catch (e) {
        emit(UpdateProductFailure(e.toString()));
      }
    } else {
      emit(UpdateProductFailure('All fields are required'));
    }
  }
}
