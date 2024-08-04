import 'package:store_app/core/networking/api.dart';
import 'package:store_app/core/networking/server_links.dart';
import 'package:store_app/features/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data = await Api().get(url: allProductsUrl);
    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
