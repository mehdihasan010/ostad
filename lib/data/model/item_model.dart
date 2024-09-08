import '../dummy/dummy_products.dart';

class ItemModel {
  final int id;
  final String name;
  final String color;
  final String size;
  int quantity;
  final int price;
  final String photo;

  ItemModel(
      {required this.id,
      required this.name,
      required this.size,
      required this.price,
      required this.color,
      required this.quantity,
      required this.photo});
}

class CardModel {
  double get totalAmount {
    return product.fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  void incrementCounter(index) {
    product[index].quantity++;
  }

  void decrementCounter(index) {
    if (product[index].quantity > 1) {
      product[index].quantity--;
    }
  }
}
