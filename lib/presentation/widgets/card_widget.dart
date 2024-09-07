import 'package:flutter/material.dart';
import 'package:module_13_assignment/presentation/style/app_color.dart';

import '../style/assets_manager.dart';

// ignore: must_be_immutable
class CardWidget extends StatefulWidget {
  CardWidget({
    super.key,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.quantity,
  });
  final String name;
  final String color;
  final String size;
  int quantity;
  final int price;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  void _incrementCounter() {
    setState(() {
      widget.quantity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.quantity > 1) {
        widget.quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.boxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AssetsManager.tShirt),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Color:',
                            style: TextStyle(color: Colors.black38),
                          ),
                          Text(widget.color),
                          const SizedBox(width: 10),
                          const Text(
                            'Size:',
                            style: TextStyle(color: Colors.black38),
                          ),
                          Text(widget.size),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _decrementCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(8),
                        ),
                        child: const Icon(Icons.remove, color: Colors.black38),
                      ),
                      Text(widget.quantity.toString()),
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(8),
                        ),
                        child: const Icon(Icons.add, color: Colors.black38),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 30,
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
                    Text('${widget.price * widget.quantity}\$',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
