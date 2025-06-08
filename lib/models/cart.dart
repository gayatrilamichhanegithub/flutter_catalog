import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  CatalogModel? _catalog;

  final List<int> _itemIds = [];
  CatalogModel? get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog!.getById(id)).whereType<Item>().toList();

  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id.toInt());
  }

  void remove(Item item) {
    _itemIds.remove(item.id.toInt());
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart.add(item);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart.remove(item);
  }
}
