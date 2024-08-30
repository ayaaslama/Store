import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/helper/extension.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:store_app/features/models/product_model.dart';

class CustomCard extends StatelessWidget {
  final ProductModel product;

  CustomCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFavorite = context.read<FavoriteCubit>().isFavorite(product);

        return GestureDetector(
          onTap: () {
            context.pushNamed(
              Routes.updateProductPage,
              arguments: product,
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(.1),
                    spreadRadius: 20,
                    offset: const Offset(10, 10),
                  ),
                ]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title.substring(0, 6),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              r'$' '${product.price.toString()}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<FavoriteCubit>()
                                    .toggleFavorite(product);
                              },
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: isFavorite ? Colors.red : Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 32,
                top: -60,
                child: Image.network(
                  product.image,
                  height: 100,
                  width: 100,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
