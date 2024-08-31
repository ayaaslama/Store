import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/widgets/custom_card.dart';
import 'package:store_app/features/categoriesProducts/logic/cubit/categories_products_cubit.dart';

class ProductsByCategoryPage extends StatelessWidget {
  final String categoryName;

  const ProductsByCategoryPage({required this.categoryName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriesProductsCubit = context.read<CategoriesProductsCubit>();
    categoriesProductsCubit.fetchCategoriesProducts(categoryName: categoryName);
    return Scaffold(
        appBar: AppBar(
          title: Text('Products in $categoryName'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocConsumer<CategoriesProductsCubit, CategoriesProductsState>(
            listener: (context, state) {
          if (state is CategoriesProductsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        }, builder: (context, state) {
          if (state is CategoriesProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesProductsLoaded) {
            final products = state.products;
            return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                child: GridView.builder(
                  clipBehavior: Clip.none,
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  },
                ));
          } else {
            return const Center(child: Text('No products available'));
          }
        }));
  }
}
