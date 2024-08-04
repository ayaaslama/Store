import 'package:store_app/core/networking/api.dart';
import 'package:store_app/core/networking/server_links.dart';
import 'package:store_app/features/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> _getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data =
        await Api().get(url: "$categoriesProductsUrl/$categoryName");
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
