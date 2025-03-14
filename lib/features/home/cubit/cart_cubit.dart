import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/interface/discount_strategy_interface.dart';
import '../domain/models/cart_item_model.dart';
import '../domain/models/prodect_model.dart';
import '../domain/repository/cart_repository.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  final Map<String, DiscountStrategy> _availableDiscounts;
  final List<DiscountStrategy> _activeDiscounts = [];

  CartCubit({
    required CartRepository cartRepository,
    required Map<String, DiscountStrategy> availableDiscounts,
  })  : _cartRepository = cartRepository,
        _availableDiscounts = availableDiscounts,
        super(CartInitial());

  void addProduct(Product product) {
    _cartRepository.addProduct(product);
    _updateState();
  }

  void removeProduct(String productId) {
    _cartRepository.removeProduct(productId);
    _updateState();
  }

  void applyPromoCode(String code) {
    final discount = _availableDiscounts[code];
    if (discount != null && !_activeDiscounts.contains(discount)) {
      _activeDiscounts.add(discount);
      _updateState();
    }
  }

  void _updateState() {
    double total = _cartRepository.subtotal;

    for (final discount in _activeDiscounts) {
      total = discount.apply(total);
    }

    emit(CartUpdated(
      items: _cartRepository.items,
      activeDiscounts: List.unmodifiable(_activeDiscounts),
      total: total < 0 ? 0 : total,
    ));
  }
}