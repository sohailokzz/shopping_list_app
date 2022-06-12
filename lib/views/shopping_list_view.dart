import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list_app/api/api_constant.dart';
import 'package:shopping_list_app/utilis/my_textfield.dart';
import 'package:http/http.dart' as http;
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
  void initState() {
    loadShopingList();
    super.initState();
  }

  loadShopingList() async {
    Uri myUri = Uri.parse(myUrl);
    var response = await http.get(myUri, headers: headers);
    if (response.statusCode == 200) {
      var responeBody = response.body;
      final List<ProductModel> loadedProducts = [];
      var extractedData = json.decode(responeBody) as Map<String, dynamic>;
      extractedData.forEach((productId, productData) {
        loadedProducts.add(
          ProductModel(
            productName: productData['productName'],
            productQuantity: productData['productQuantity'],
          ),
        );
      });
      allProducts = loadedProducts;

      setState(() {});
    }
  }

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
      body: allProducts.isEmpty
          ? const Center(
              child: Text('No items available for shopping'),
            )
          : ListView(
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
      itemCount: allProducts.length,
      itemBuilder: ((context, index) {
        return Card(
          elevation: 5.0,
          child: ListTile(
            title: Text(
              'Product Name: ${allProducts[index].productName}',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Quantity: ${allProducts[index].productQuantity}',
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
