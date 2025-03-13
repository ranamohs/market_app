
import 'package:get_it/get_it.dart';

import '../../interface/discount_strategy_interface.dart';
import '../../repository/cart_repository.dart';
import '../cart_model.dart';
import '../strategies/discount_strategy.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<CartRepository>(() => Cart());

  getIt.registerLazySingleton<Map<String, DiscountStrategy>>(
        () => {
      'FIXED10': FixedDiscountStrategy(10),
      'PERCENT20': PercentageDiscountStrategy(0.2),
    },
  );
}