import 'package:flutter/material.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/models/product_model.dart';
import 'package:store_app/features/pages/add_product_page.dart';
import 'package:store_app/features/pages/categories_page.dart';
import 'package:store_app/features/pages/home_page.dart';
import 'package:store_app/features/pages/products_by_category_page.dart';
import 'package:store_app/features/pages/update_product_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.updateProductPage:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => UpdateProductPage(product: product),
        );

      case Routes.addProductPage:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case Routes.categoriesPage:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case Routes.productsByCategoryPage:
        final categoryName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductsByCategoryPage(categoryName: categoryName),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No Route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
