import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product_list_screen.dart';

class ProductListApp extends StatefulWidget {
  const ProductListApp({super.key});

  @override
  State<ProductListApp> createState() => _ProductListAppState();
}

class _ProductListAppState extends State<ProductListApp> {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ProductListScreen()
    );
  }
}