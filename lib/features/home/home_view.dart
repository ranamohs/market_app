import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview/features/home/cubit/cart_cubit.dart';
import 'package:interview/features/home/data/discount_model.dart';
import 'package:interview/features/home/widget/product_item.dart';
import 'package:interview/features/home/widget/tab_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(
        validPromoCodes: {
          'SAVE10': FixedDiscountModel(10),
          'HALFOFF': PercentageDiscountModel(0.5),
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
