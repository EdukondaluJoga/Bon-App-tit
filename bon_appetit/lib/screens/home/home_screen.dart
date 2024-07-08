import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/controllers/category_controller.dart';
import 'package:bon_appetit/screens/home/all_fastest_food_screen.dart';
import 'package:bon_appetit/screens/home/all_nearby_restaurants.dart';
import 'package:bon_appetit/screens/home/recommendations_screen.dart';
import 'package:bon_appetit/screens/home/widget_box/categories_list.dart';
import 'package:bon_appetit/screens/home/widget_box/category_foods_list.dart';
import 'package:bon_appetit/screens/home/widget_box/foods_list.dart';
import 'package:bon_appetit/screens/home/widget_box/nearby_restaurants_list.dart';
import 'package:bon_appetit/widgets/custom_appbar.dart';
import 'package:bon_appetit/widgets/custom_container.dart';
import 'package:bon_appetit/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: Customcontainer(
            containerContent: Column(
          children: [
            const CategoryList(),
            Obx(
              () => controller.categoryValue == ''
                  ? Column(
                      children: [
                        Heading(
                          text: "Try Something New",
                          onTap: () {
                            Get.to(() => const RecommendationsPage(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          },
                        ),
                        const FoodsList(),
                        Heading(
                          text: "Nearby Restaurants",
                          onTap: () {
                            Get.to(() => const AllNearbyRestaurants(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          },
                        ),
                        const NearbyRestaurants(),
                        Heading(
                          text: "Food closer to you",
                          onTap: () {
                            Get.to(() => const AllFastestFoods(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          },
                        ),
                        const FoodsList(),
                      ],
                    )
                  : Customcontainer(
                      containerContent: Column(
                      children: [
                        Heading(
                          more: true,
                          text: "Explore ${controller.titleValue} Category",
                          onTap: () {
                            Get.to(() => const RecommendationsPage(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          },
                        ),
                        const CategoryFoodsList()
                      ],
                    )),
            ),
          ],
        )),
      ),
    );
  }
}
