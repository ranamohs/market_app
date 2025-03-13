part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final List<DiscountStrategy> activeDiscounts;
  final double total;

  const CartUpdated({
    required this.items,
    required this.activeDiscounts,
    required this.total,
  });

  @override
  List<Object> get props => [items, activeDiscounts, total];
}