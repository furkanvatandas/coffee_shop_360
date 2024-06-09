import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CoffeeDescription extends StatelessWidget {
  final String description;

  const CoffeeDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: CustomColors.starDust),
        ),
      ],
    );
  }
}
