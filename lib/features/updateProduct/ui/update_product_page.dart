import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_field.dart';
import 'package:store_app/features/models/product_model.dart';
import 'package:store_app/features/updateProduct/logic/cubit/update_product_cubit.dart';

class UpdateProductPage extends StatelessWidget {
  final ProductModel product;
  const UpdateProductPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateProductCubit = context.read<UpdateProductCubit>();
    updateProductCubit
      ..title = product.title
      ..description = product.description
      ..price = product.price.toString()
      ..image = product.image
      ..category = product.category
      ..id = product.id;
    return BlocConsumer<UpdateProductCubit, UpdateProductState>(
      listener: (context, state) {
        if (state is UpdateProductLoaded) {
          Navigator.pop(context);
        } else if (state is UpdateProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateProductLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Update Product'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(
                      initialValue: updateProductCubit.title,
                      onChanged: (data) {
                        updateProductCubit.title = data;
                      },
                      hintText: 'Product Name',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      initialValue: updateProductCubit.description,
                      onChanged: (data) {
                        updateProductCubit.description = data;
                      },
                      hintText: 'Description',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      initialValue: updateProductCubit.price,
                      onChanged: (data) {
                        updateProductCubit.price = data;
                      },
                      hintText: 'Price',
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      initialValue: updateProductCubit.image,
                      onChanged: (data) {
                        updateProductCubit.image = data;
                      },
                      hintText: 'Image URL',
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Update',
                      onTap: () {
                        updateProductCubit.updateProduct();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
