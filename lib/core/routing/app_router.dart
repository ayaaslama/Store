import 'package:flutter/material.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/addProduct/ui/add_product_page.dart';
import 'package:store_app/features/categories/ui/categories_page.dart';
import 'package:store_app/features/categoriesProducts/ui/products_by_category_page.dart';
import 'package:store_app/features/favorites/ui/favorite_page.dart';
import 'package:store_app/features/home/ui/home_page.dart';
import 'package:store_app/features/models/product_model.dart';
import 'package:store_app/features/updateProduct/ui/update_product_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.updateProductPage:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => UpdateProductPage(product: product),
        );

      case Routes.addProductPage:
        return MaterialPageRoute(builder: (_) => const AddProductPage());
      case Routes.categoriesPage:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case Routes.favoritesPage:
        return MaterialPageRoute(builder: (_) => FavoritesPage());
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
