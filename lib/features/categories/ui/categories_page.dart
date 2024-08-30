import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/categories/logic/cubit/categories_cubit.dart';
import 'package:store_app/features/categoriesProducts/ui/products_by_category_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CategoriesLoaded) {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.categories[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsByCategoryPage(
                          categoryName: state.categories[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is CategoriesError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }
          return const Center(child: Text('No categories found'));
        },
      ),
    );
  }
}
