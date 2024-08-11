import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/services/update_product.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_field.dart';
import 'package:store_app/features/models/product_model.dart';

class UpdateProductPage extends StatefulWidget {
  final ProductModel product;

  UpdateProductPage({required this.product, Key? key}) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image URL',
                ),
                const SizedBox(height: 20),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                      errorMessage = null; // Reset error message
                    });
                    try {
                      await updateProduct(widget.product);
                      Navigator.pop(context); // Return to previous page
                    } catch (e) {
                      setState(() {
                        errorMessage = 'Failed to update product';
                      });
                      print(e.toString());
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName ?? product.title,
      price: price ?? product.price.toString(),
      desc: desc ?? product.description,
      image: image ?? product.image,
      category: product.category,
    );
  }
}
