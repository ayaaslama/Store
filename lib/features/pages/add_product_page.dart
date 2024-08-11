import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/services/add_product.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? title, price, description, image, category;
  bool isLoading = false;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
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
                    title = data;
                  },
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    description = data;
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
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    category = data;
                  },
                  hintText: 'Category',
                ),
                const SizedBox(height: 20),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Add',
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                      errorMessage = null;
                    });
                    try {
                      await AddProduct().addProduct(
                        title: title!,
                        price: price!,
                        description: description!,
                        image: image!,
                        category: category!,
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      setState(() {
                        errorMessage = 'Failed to add product';
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
}
