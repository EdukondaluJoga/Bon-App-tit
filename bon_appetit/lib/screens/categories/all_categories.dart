import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/hooks/fetch_all_categories.dart';
import 'package:bon_appetit/models/categories.dart';
import 'package:bon_appetit/screens/categories/category_tile.dart';
import 'package:bon_appetit/widgets/background_container.dart';
import 'package:bon_appetit/widgets/resuable_text.dart';
import 'package:bon_appetit/widgets/shimmers/foodlist_shimmer.dart';
import 'package:bon_appetit/widgets/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: "Categories", style: styling(12, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categories!.length, (i) {
                    CategoriesModel category = categories[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
