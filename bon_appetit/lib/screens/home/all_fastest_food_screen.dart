import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/hooks/fetch_all_foods.dart';
import 'package:bon_appetit/models/foods.dart';
import 'package:bon_appetit/screens/home/widget_box/foods_tiles.dart';
import 'package:bon_appetit/widgets/background_container.dart';
import 'package:bon_appetit/widgets/resuable_text.dart';
import 'package:bon_appetit/widgets/shimmers/foodlist_shimmer.dart';
import 'package:bon_appetit/widgets/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
            text: "Fastest Foods",
            style: styling(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(foods!.length, (i) {
                    FoodsModel food = foods[i];
                    return FoodTile(
                      food: food,
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
