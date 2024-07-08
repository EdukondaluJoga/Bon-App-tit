import 'package:bon_appetit/constants/constants.dart';
import 'package:bon_appetit/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(
            height: 130.h,
          )),
      body: SafeArea(
        child: Customcontainer(containerContent: Container()),
      ),
    );
  }
}
