import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list_app/utilis/my_textfield.dart';

import '../model/product_model.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final productNameController = TextEditingController();
  final productQuantityController = TextEditingController();
  List<ProductModel> allProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping List',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                MyTextField(
                  labelText: 'Product Name',
                  textEditingController: productNameController,
                ),
                const SizedBox(
                  height: 12,
                ),
                MyTextField(
                  labelText: 'Product Quantity',
                  textEditingController: productQuantityController,
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Item',
                  ),
                ),
              ],
            ),
          ),
          showShopingList(),
        ],
      ),
    );
  }

  Widget showShopingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Card(
          elevation: 5.0,
          child: ListTile(
            title: Text(
              'Product Name',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Quantity',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}
