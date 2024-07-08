// ignore_for_file: must_be_immutable

import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/controllers/home_tab_controller.dart';
import 'package:bon_appetit/screens/cart/cart_screen.dart';
import 'package:bon_appetit/screens/home/home_screen.dart';
import 'package:bon_appetit/screens/profile/profile_screen.dart';
import 'package:bon_appetit/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> screenList = const [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeTabController());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              screenList[controller.homeTabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: kPrimary),
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      selectedIconTheme:
                          const IconThemeData(color: Colors.white),
                      onTap: (value) {
                        controller.setHomeTabIndex = value;
                      },
                      currentIndex: controller.homeTabIndex,
                      items: [
                        BottomNavigationBarItem(
                            icon: controller.homeTabIndex == 0
                                ? const Icon(Ionicons.fast_food)
                                : const Icon(Ionicons.fast_food_outline),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: controller.homeTabIndex == 1
                                ? const Icon(AntDesign.search1)
                                : const Icon(Icons.search),
                            label: 'Search'),
                        const BottomNavigationBarItem(
                            icon: Badge(
                                label: Text('0'),
                                child: Icon(FontAwesome.opencart)),
                            label: 'Cart'),
                        BottomNavigationBarItem(
                            icon: controller.homeTabIndex == 3
                                ? const Icon(FontAwesome.user_circle)
                                : const Icon(FontAwesome.user_circle_o),
                            label: 'Profile'),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
