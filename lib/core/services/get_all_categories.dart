import 'package:store_app/core/networking/api.dart';
import 'package:store_app/core/networking/server_links.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: allCategoriesUrl);
    return data;
  }
}
