import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatelogModel _catelog;

  final List<int> _itemIds = [];

  CatelogModel get catelog => _catelog;

  set catelog(CatelogModel newcatelog) {
    // ignore: unnecessary_null_comparison
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

class AddMutation extends VxMutation<MyStore> {
  late final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
    throw UnimplementedError();
  }
}


class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
    throw UnimplementedError();
  }
}
