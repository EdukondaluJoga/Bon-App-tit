import 'package:bon_appetit/hooks/fetch_foods.dart';
import 'package:bon_appetit/models/foods.dart';
import 'package:bon_appetit/screens/food/food_screen.dart';
import 'package:bon_appetit/screens/home/widget_box/food_widgets.dart';
import 'package:bon_appetit/widgets/shimmers/nearby_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodsList extends HookWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                    onTap: () {
                      Get.to(() => FoodScreen(food: food));
                    },
                    image: food.imageUrl[0],
                    title: food.title,
                    time: food.time,
                    price: food.price.toStringAsFixed(2));
              }),
            ),
    );
  }
}
