
import 'package:interview/features/home/data/prodect_model.dart';

import '../repository/cart_repository.dart';
import 'cart_item_model.dart';

class Cart implements CartRepository {
  final List<CartItem> _items = [];

  @override
  List<CartItem> get items => List.unmodifiable(_items);

  @override
  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  @override
  void addProduct(Product product) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index] = CartItem(
        product: product,
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartItem(product: product));
    }
  }

  @override
  void removeProduct(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
  }
}