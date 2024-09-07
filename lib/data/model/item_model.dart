class ItemModel {
  final int id;
  final String name;
  final String color;
  final String size;
  final int quantity;
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
