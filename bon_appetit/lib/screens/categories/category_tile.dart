import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/controllers/category_controller.dart';
import 'package:bon_appetit/models/categories.dart';
import 'package:bon_appetit/screens/categories/category_screen.dart';
import 'package:bon_appetit/widgets/resuable_text.dart';
import 'package:bon_appetit/widgets/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(() => const CategoryScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kWhite,
        child: ClipOval(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: ReusableText(
          text: category.title, style: styling(12, kGray, FontWeight.normal)),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
