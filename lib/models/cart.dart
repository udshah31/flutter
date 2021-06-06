import 'package:flutter_catlog/models/catelog.dart';

class CartModel {
  late CatelogModel _catelog;

  final List<int> _itemIds = [];

  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newcatelog) {
    assert(newcatelog != null);
    _catelog = newcatelog;
  }

  // get item in the cart

  List<Item> get items => _itemIds.map((id) => catelog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
