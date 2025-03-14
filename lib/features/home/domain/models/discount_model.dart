import 'dart:developer';

abstract class DiscountModel {
  double apply(double currentTotal);
}

class FixedDiscountModel implements DiscountModel {
  final double amount;

  FixedDiscountModel(this.amount);

  @override
  double apply(double currentTotal) => currentTotal - amount;
}

class PercentageDiscountModel implements DiscountModel {
  final double percentage;

  PercentageDiscountModel(this.percentage) {
    if (percentage < 0 || percentage > 1) {
      log('Percentage must be between 0 and 1.');
    }
  }
  @override
  double apply(double currentTotal) => currentTotal * (1 - percentage);
}
