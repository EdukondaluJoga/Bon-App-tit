import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/controllers/search_conroller.dart';
import 'package:bon_appetit/models/foods.dart';
import 'package:bon_appetit/screens/home/widget_box/foods_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
          itemCount: controller.searchResults!.length,
          itemBuilder: (context, i) {
            FoodsModel food = controller.searchResults![i];
            return FoodTile(food: food);
          }),
    );
  }
}
