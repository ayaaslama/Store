import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/services/get_all_products.dart';
import 'package:store_app/features/models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AllProductsService _allProductsService;

  HomeCubit(this._allProductsService) : super(HomeInitial());

  Future<void> fetchProducts() async {
    emit(HomeLoading());
    try {
      final List<ProductModel> products =
          await _allProductsService.getAllProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError('Failed to load products: $e'));
    }
  }
}
