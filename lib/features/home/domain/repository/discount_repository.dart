import 'dart:developer';
import '../interface/discount_strategy_interface.dart';

class FixedDiscountStrategy implements DiscountStrategy {
  final double amount;

  FixedDiscountStrategy(this.amount);

  @override
  double apply(double currentTotal) => currentTotal - amount;
}

class PercentageDiscountStrategy implements DiscountStrategy {
  final double percentage;

  PercentageDiscountStrategy(this.percentage) {
    if (percentage < 0 || percentage > 1) {
      log('Percentage must be between 0 and 1.');
    }
  }

  @override
  double apply(double currentTotal) => currentTotal * (1 - percentage);
}