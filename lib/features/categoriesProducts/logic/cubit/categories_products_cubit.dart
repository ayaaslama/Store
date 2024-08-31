import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/services/categories_service.dart';
import 'package:store_app/features/models/product_model.dart';

part 'categories_products_state.dart';

class CategoriesProductsCubit extends Cubit<CategoriesProductsState> {
  final CategoriesService _categoriesService;
  CategoriesProductsCubit(this._categoriesService)
      : super(CategoriesProductsInitial());
  Future<void> fetchCategoriesProducts({required String categoryName}) async {
    emit(CategoriesProductsLoading());
    try {
      final List<ProductModel> products = await _categoriesService
          .getCategoriesProducts(categoryName: categoryName);
      emit(CategoriesProductsLoaded(products));
    } catch (e) {
      emit(CategoriesProductsFailure('Failed to load products: $e'));
    }
  }
}
