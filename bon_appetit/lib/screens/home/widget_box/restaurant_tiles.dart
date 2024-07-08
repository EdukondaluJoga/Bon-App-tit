// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/models/restaurants.dart';
import 'package:bon_appetit/screens/restaurants/restaurants_screen.dart';
import 'package:bon_appetit/widgets/resuable_text.dart';
import 'package:bon_appetit/widgets/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestaurantTile extends StatelessWidget {
  RestaurantTile({super.key, required this.restaurant});

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => RestaurantScreen(restaurant: restaurant));
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              height: 70.h,
              width: width,
              decoration: BoxDecoration(
                  color: kOffWhite, borderRadius: BorderRadius.circular(9.r)),
              child: Container(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.network(
                              restaurant.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 3.w, bottom: 2.h),
                              color: kGray.withOpacity(0.6),
                              height: 16.h,
                              width: width,
                              child: RatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemBuilder: (context, i) => const Icon(
                                  Icons.star,
                                  color: kSecondary,
                                ),
                                itemSize: 13.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: restaurant.title,
                          style: styling(11, kDark, FontWeight.w400),
                        ),
                        ReusableText(
                          text: "Delivery time: ${restaurant.time}",
                          style: styling(11, kGray, FontWeight.w400),
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            restaurant.coords.address,
                            overflow: TextOverflow.ellipsis,
                            style: styling(9, kGray, FontWeight.w400),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 6.h,
              child: Container(
                width: 60.w,
                height: 19.h,
                decoration: BoxDecoration(
                    color: restaurant.isAvailable == true ||
                            restaurant.isAvailable == null
                        ? kPrimary
                        : kSecondaryLight,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: ReusableText(
                      text: restaurant.isAvailable == true ||
                              restaurant.isAvailable == null
                          ? "Open"
                          : "Closed",
                      style: styling(12, kLightWhite, FontWeight.w600)),
                ),
              ),
            )
          ],
        ));
  }
}
