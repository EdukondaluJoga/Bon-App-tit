import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/hooks/fetch_all_restaurants.dart';
import 'package:bon_appetit/models/restaurants.dart';
import 'package:bon_appetit/screens/home/widget_box/restaurant_tiles.dart';
import 'package:bon_appetit/widgets/background_container.dart';
import 'package:bon_appetit/widgets/resuable_text.dart';
import 'package:bon_appetit/widgets/shimmers/foodlist_shimmer.dart';
import 'package:bon_appetit/widgets/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
            text: "Nearby Restaurants",
            style: styling(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(restaurants!.length, (i) {
                    RestaurantsModel restaurant = restaurants[i];
                    return RestaurantTile(
                      restaurant: restaurant,
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
