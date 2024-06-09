import 'package:coffee_shop_360/features/product_detail/presentation/components/coffee_size_selection.dart';
import 'package:flutter/material.dart';

class CoffeeSize extends StatelessWidget {
  const CoffeeSize({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Size",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        CoffeeSizeSelection(
          coffeeNames: ["S", "M", "L"],
        ),
      ],
    );
  }
}
