
import 'package:get_it/get_it.dart';
import '../../features/home/domain/interface/discount_strategy_interface.dart';
import '../../features/home/domain/models/cart_model.dart';
import '../../features/home/domain/repository/cart_repository.dart';
import '../../features/home/domain/repository/discount_repository.dart';



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