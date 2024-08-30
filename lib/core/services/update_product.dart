import 'package:store_app/core/networking/api.dart';
import 'package:store_app/core/networking/server_links.dart';
import 'package:store_app/features/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required int id,
      required String category}) async {
    print('product id  = $id');
    Map<String, dynamic> data =
        await Api().put(url: '$updateProductUrl$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });

    return ProductModel.fromJson(data);
  }
}
