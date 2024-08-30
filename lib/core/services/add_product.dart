import 'package:store_app/core/networking/api.dart';
import 'package:store_app/core/networking/server_links.dart';
import 'package:store_app/features/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data = await Api().post(url: addProductUrl, body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
