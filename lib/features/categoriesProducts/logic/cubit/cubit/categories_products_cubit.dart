import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_products_state.dart';

class CategoriesProductsCubit extends Cubit<CategoriesProductsState> {
  CategoriesProductsCubit() : super(CategoriesProductsInitial());
}
