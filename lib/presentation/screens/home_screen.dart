import 'package:flutter/material.dart';
import 'package:module_13_assignment/presentation/style/app_color.dart';
import 'package:module_13_assignment/presentation/widgets/card_widget.dart';

import '../../data/dummy/dummy_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double get totalAmount {
    return shirtItem.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        //toolbarHeight: 100,
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "My Bag",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: shirtItem.length,
          itemBuilder: (context, index) {
            return CardWidget(
                name: shirtItem[index].name,
                color: shirtItem[index].color,
                size: shirtItem[index].size,
                quantity: shirtItem[index].quantity,
                price: shirtItem[index].price);
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total amount:',
                  style: TextStyle(color: Colors.black38),
                ),
                Text(
                  '${totalAmount.toStringAsFixed(0)}\$',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                          'Congratulations! You have checked out successfully.'),
                    ),
                  );
                },
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
