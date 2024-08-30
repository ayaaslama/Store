import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/helper/extension.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/widgets/bottom_navigation_bar.dart';
import 'package:store_app/core/widgets/custom_card.dart';
import 'package:store_app/features/home/logic/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('New Trend', style: TextStyle(color: Colors.black)),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            final products = state.products;
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().fetchProducts();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
                child: GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  },
                ),
              ),
            );
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('No products available'));
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        items: const [
          {'icon': Icons.home, 'label': 'Home'},
          {'icon': Icons.favorite, 'label': 'Favorites'},
          {'icon': Icons.category, 'label': 'Categories'},
          {'icon': Icons.add, 'label': 'Add Product'},
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.pushNamed(Routes.homePage);
              break;
            case 1:
              context.pushNamed(Routes.favoritesPage);
              break;
            case 2:
              context.pushNamed(Routes.categoriesPage);
              break;
            case 3:
              context.pushNamed(Routes.addProductPage);
              break;
          }
        },
      ),
    );
  }
}
