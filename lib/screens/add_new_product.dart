import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _productNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        //hintText: 'Name',
                        labelText: 'Product Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Product Name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _productCodeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        //hintText: 'Code',
                        labelText: 'Product Code'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Product Code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _productPriceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        //hintText: 'Price',
                        labelText: 'Product Price'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Product Price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _productQuantityController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        //hintText: 'Quantity',
                        labelText: 'Product Quantity'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Product Quantity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _totalPriceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        //hintText: 'Total Price',
                        labelText: 'Total Price'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Total Price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        backgroundColor: Colors.blueGrey.shade200),
                    onPressed: _onTapAddProductButton,
                    child: const Text(
                      'Add Item',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _onTapAddProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    }
  }

  Future<void> addNewProduct() async {
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Map<String, dynamic> requestBody = {
      "Img": "photo.jpg",
      "ProductCode": _productCodeController.text,
      "ProductName": _productNameController.text,
      "Qty": _productQuantityController.text,
      "TotalPrice": _totalPriceController.text,
      "UnitPrice": _productPriceController.text
    };
    Response response = await post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data Added successfully')),
        );
        Navigator.pop(context, true);
      }
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _productPriceController.dispose();
    _productQuantityController.dispose();
    _totalPriceController.dispose();
    super.dispose();
  }
}
