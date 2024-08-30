import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/services/add_product.dart';
import 'package:store_app/core/services/get_all_categories.dart';
import 'package:store_app/core/services/get_all_products.dart';
import 'package:store_app/features/addProduct/logic/cubit/add_product_cubit.dart';
import 'package:store_app/features/categories/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart'; // تأكد من استيراد HomeCubit
import 'package:store_app/features/home/ui/home_page.dart';

void main() {
  runApp(StoreApp(
    appRouter: AppRouter(),
  ));
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider<AddProductCubit>(
          create: (context) => AddProductCubit(AddProduct()),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) =>
              CategoriesCubit(AllCategoriesService())..fetchCategories(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(AllProductsService()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
