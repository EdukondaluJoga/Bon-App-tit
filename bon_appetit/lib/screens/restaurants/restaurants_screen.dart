import 'package:bon_appetit/models/restaurants.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.restaurant!.coords.address);
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
