import '../data/cart_item_model.dart';
import '../data/prodect_model.dart';

abstract class CartRepository {
  List<CartItem> get items;
  double get subtotal;

  void addProduct(Product product);
  void removeProduct(String productId);
}