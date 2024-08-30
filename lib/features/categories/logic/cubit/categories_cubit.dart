import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/services/get_all_categories.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final AllCategoriesService _allCategoriesService;

  CategoriesCubit(this._allCategoriesService) : super(CategoriesInitial());

  Future<void> fetchCategories() async {
    emit(CategoriesLoading());
    try {
      final List<dynamic> data = await _allCategoriesService.getAllCategories();
      final categories = data.cast<String>();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoriesError('Failed to upload products: $e'));
    }
  }
}
