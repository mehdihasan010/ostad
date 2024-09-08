import 'package:flutter/material.dart';
import 'package:module_13_assignment/data/model/item_model.dart';
import 'package:module_13_assignment/presentation/style/app_color.dart';
import '../../data/dummy/dummy_products.dart';
import '../style/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CardModel cardModel = CardModel();

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
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.boxColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(AssetsManager.tShirt),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product[index].name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Color:',
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      Text(product[index].color),
                                      const SizedBox(width: 10),
                                      const Text(
                                        'Size:',
                                        style: TextStyle(color: Colors.black38),
                                      ),
                                      Text(product[index].size),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      cardModel.decrementCounter(index);
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(8),
                                    ),
                                    child: const Icon(Icons.remove,
                                        color: Colors.black38),
                                  ),
                                  Text(product[index].quantity.toString()),
                                  ElevatedButton(
                                    onPressed: () {
                                      cardModel.incrementCounter(index);
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(8),
                                    ),
                                    child: const Icon(Icons.add,
                                        color: Colors.black38),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.more_vert,
                              color: Colors.black38,
                            ),
                            Text(
                                '${product[index].price * product[index].quantity}\$',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
            /*CardWidget(
              name: shirtItem[index].name,
              color: shirtItem[index].color,
              size: shirtItem[index].size,
              quantity: shirtItem[index].quantity,
              price: shirtItem[index].price);*/
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
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
                  '${cardModel.totalAmount.toStringAsFixed(0)}\$',
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
