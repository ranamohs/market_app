import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/features/home/data/discount_model.dart';
import '../data/cart_item_model.dart';
import '../data/cart_model.dart';
import '../data/prodect_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Cart _cart = Cart();
  final Map<String, DiscountModel> validPromoCodes;
  final List<DiscountModel> _activeDiscounts = [];

  CartCubit({required this.validPromoCodes}) : super(CartInitial());

  void addProduct(Product product) {
    _cart.addProduct(product);
    _updateState();
  }

  void removeProduct(String productId) {
    _cart.removeProduct(productId);
    _updateState();
  }

  void applyPromoCode(String code) {
    final discount = validPromoCodes[code];
    if (discount != null && !_activeDiscounts.contains(discount)) {
      _activeDiscounts.add(discount);
      _updateState();
    }
  }

  void _updateState() {
    double total = _cart.subtotal;
    for (final discount in _activeDiscounts) {
      total = discount.apply(total);
    }
    emit(CartUpdated(
      items: _cart.items,
      activeDiscounts: List.unmodifiable(_activeDiscounts),
      total: total < 0 ? 0 : total,
    ));
  }
}
