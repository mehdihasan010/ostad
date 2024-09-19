// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/add_new_product.dart';
import 'package:flutter_application_1/widgets/product_item.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getProductList();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: _inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) => ProductItem(
                  product: productList[index],
                  onDelete: () {
                    getProductList();
                    setState(() {});
                  },
                ),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // Navigate to the AddNewProduct screen and wait for a result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AddNewProduct(),
            ),
          );

          // If the result is true, refresh the product list
          if (result == true) {
            getProductList();
          }
        },
        label: const Text('Add Item'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList() async {
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
            id: item['_id'],
            productName: item['ProductName'],
            productCode: item['ProductCode'],
            img: item['Img'],
            unitPrice: item['UnitPrice'],
            qty: item['Qty'],
            totalPrice: item['TotalPrice'],
            createdDate: item['CreatedDate']);
        productList.add(product);
      }
    } else {
      print('not response');
    }
    _inProgress = false;
    setState(() {});
  }
}
