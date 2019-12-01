import 'package:flutter/foundation.dart';
import 'market_list_model.dart';

class FavouriteModel extends ChangeNotifier {
  /// The current catalog. Used to construct items from numeric ids.
  final MarketListModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds;

  /// Construct a CartModel instance that is backed by a [MarketListModel] and
  /// an optional previous state of the cart.
  ///
  /// If [previous] is not `null`, it's items are copied to the newly
  /// constructed instance.
  FavouriteModel(this._catalog, FavouriteModel previous)
      : assert(_catalog != null),
        _itemIds = previous?._itemIds ?? [];

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }
}
