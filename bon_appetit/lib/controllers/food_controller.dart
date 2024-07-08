import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currrentScreen = 0.obs;

  void changeScreen(int index) {
    currrentScreen.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }
}
