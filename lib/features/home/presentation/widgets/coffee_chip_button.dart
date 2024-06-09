import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CoffeeChipButton extends StatelessWidget {
  final String coffeeName;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeChipButton({
    super.key,
    required this.coffeeName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? CustomColors.orangeSalmon : CustomColors.aquaHaze,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          coffeeName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.white : CustomColors.plantation,
          ),
        ),
      ),
    );
  }
}
