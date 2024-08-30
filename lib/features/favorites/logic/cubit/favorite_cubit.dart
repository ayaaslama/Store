import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/models/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  void toggleFavorite(ProductModel product) {
    List<ProductModel> currentFavorites = [];

    if (state is FavoriteSuccess) {
      currentFavorites =
          List<ProductModel>.from((state as FavoriteSuccess).favorites);
    }

    if (currentFavorites.contains(product)) {
      currentFavorites.remove(product);
    } else {
      currentFavorites.add(product);
    }

    emit(FavoriteSuccess(currentFavorites));
  }

  bool isFavorite(ProductModel product) {
    if (state is FavoriteSuccess) {
      return (state as FavoriteSuccess).favorites.contains(product);
    }
    return false;
  }
}
