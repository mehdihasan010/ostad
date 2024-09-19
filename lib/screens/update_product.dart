import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct(
      {super.key, required this.product, required this.onUpdate});
  final Product product;
  final Function onUpdate;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  late final TextEditingController _productNameController =
      TextEditingController(text: widget.product.productName);
  late final TextEditingController _productCodeController =
      TextEditingController(text: widget.product.productCode);
  late final TextEditingController _productPriceController =
      TextEditingController(text: widget.product.unitPrice.toString());
  late final TextEditingController _productQuantityController =
      TextEditingController(text: widget.product.qty.toString());
  late final TextEditingController _totalPriceController =
      TextEditingController(text: widget.product.totalPrice.toString());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
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
                    onPressed: () {
                      _onTapUpdateProductButton(widget.product.id.toString());
                    },
                    child: const Text(
                      'Update Item',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _onTapUpdateProductButton(String productId) {
    if (_formKey.currentState!.validate()) {
      updateProduct(productId);
    }
  }

  Future<void> updateProduct(String productId) async {
    Uri uri =
        Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/$productId');
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
          const SnackBar(content: Text('Data Update successfully')),
        );
        Navigator.pop(context, true);
      }
    } else {
      // ignore: avoid_print
      print(response.statusCode);
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
