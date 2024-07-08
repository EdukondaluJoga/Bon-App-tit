// ignore_for_file: unused_field

import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/controllers/search_conroller.dart';
import 'package:bon_appetit/screens/search/loading_widget.dart';
import 'package:bon_appetit/screens/search/search_results.dart';
import 'package:bon_appetit/widgets/custom_container.dart';
import 'package:bon_appetit/widgets/custom_text_field.dart';
import 'package:bon_appetit/widgets/shimmers/foodlist_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(() => Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextWidget(
                controller: _searchController,
                keyboardType: TextInputType.text,
                hintText: "Search For Foods",
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.isTriggered == false) {
                        controller.searchFoods(_searchController.text);
                        controller.setTrigger = true;
                      } else {
                        controller.searchResults = null;
                        controller.setTrigger = false;
                        _searchController.clear();
                      }
                    },
                    child: controller.isTriggered == false
                        ? Icon(Ionicons.search_circle,
                            size: 40.h, color: kPrimary)
                        : Icon(Ionicons.close, size: 40.h, color: kGray)),
              ),
            ),
          ),
          body: SafeArea(
            child: Customcontainer(
                color: Colors.white,
                containerContent: controller.isLoading
                    ? const FoodsListShimmer()
                    : controller.searchResults == null
                        ? const LoadingWidget()
                        : const SearchResults()),
          ),
        ));
  }
}
