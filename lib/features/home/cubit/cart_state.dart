part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final List<CartItem> items;
  final List<DiscountModel> activeDiscounts;
  final double total;

  const CartState({
    this.items = const [],
    this.activeDiscounts = const [],
    this.total = 0,
  });

  @override
  List<Object> get props => [items, activeDiscounts, total];
}

class CartInitial extends CartState {
  const CartInitial() : super();
}

class CartUpdated extends CartState {
  const CartUpdated({
    required super.items,
    required super.activeDiscounts,
    required super.total,
  });
}
