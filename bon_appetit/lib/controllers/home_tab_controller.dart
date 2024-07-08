// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class HomeTabController extends GetxController {
  RxInt _homeTabIndex = 0.obs;
  int get homeTabIndex => _homeTabIndex.value;

  set setHomeTabIndex(int newValue) {
    _homeTabIndex.value = newValue;
  }
}
