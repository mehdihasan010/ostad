import '../../presentation/style/assets_manager.dart';
import '../model/item_model.dart';

final List<ItemModel> product = [
  ItemModel(
      id: 1,
      name: 'Pullover',
      color: 'Black',
      size: 'L',
      price: 51,
      quantity: 1,
      photo: AssetsManager.tShirt),
  ItemModel(
      id: 2,
      name: 'T-Shirt',
      color: 'Gray',
      size: 'L',
      price: 30,
      quantity: 1,
      photo: AssetsManager.tShirt),
  ItemModel(
      id: 3,
      name: 'Sport Dress',
      color: 'Black',
      size: 'M',
      price: 43,
      quantity: 1,
      photo: AssetsManager.tShirt),
];

//final cartCountList = <int>[];
