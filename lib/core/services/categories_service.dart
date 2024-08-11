import 'package:store_app/core/networking/api.dart';
import 'package:store_app/features/models/product_model.dart';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productsList =
        data.map((item) => ProductModel.fromJson(item)).toList();
    return productsList;
  }
}
