import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_field.dart';
import 'package:store_app/features/addProduct/logic/cubit/add_product_cubit.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          Navigator.pop(context);
        } else if (state is AddProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Add New Product'),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextField(
                      onChanged: (data) {
                        context.read<AddProductCubit>().title = data;
                      },
                      hintText: 'Product Name',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (data) {
                        context.read<AddProductCubit>().description = data;
                      },
                      hintText: 'Description',
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (data) {
                        context.read<AddProductCubit>().price = data;
                      },
                      hintText: 'Price',
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (data) {
                        context.read<AddProductCubit>().image = data;
                      },
                      hintText: 'Image URL',
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      value: context.read<AddProductCubit>().category,
                      items: [
                        'electronics',
                        'jewelery',
                        "men's clothing",
                        "women's clothing"
                      ].map((String category) {
                        return DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        context.read<AddProductCubit>().category = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Add',
                      onTap: () {
                        context.read<AddProductCubit>().addProduct();
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
