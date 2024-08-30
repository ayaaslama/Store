part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<ProductModel> favorites;

  FavoriteSuccess(this.favorites);

  @override
  List<Object> get props => [favorites];
}
