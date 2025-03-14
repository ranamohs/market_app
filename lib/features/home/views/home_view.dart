import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/features/home/cubit/cart_cubit.dart';
import 'package:interview/features/home/views/widget/product_item.dart';
import 'package:interview/features/home/views/widget/tab_bar_widget.dart';
import '../domain/models/cart_model.dart';
import '../domain/repository/discount_repository.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        cartRepository: Cart(),
        availableDiscounts: {
          'SAVE10': FixedDiscountStrategy(10),
          'HALFOFF': PercentageDiscountStrategy(0.5),
        },
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Vegetables',
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TabBarWidget(),
            SizedBox(height: 16.h),
            Expanded(child: ProductListWidget()),
          ],
        ),
      ),
    );
  }
}