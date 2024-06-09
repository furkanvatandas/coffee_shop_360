import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CoffeeSizeChipButton extends StatelessWidget {
  final String coffeeName;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeSizeChipButton({
    super.key,
    required this.coffeeName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? CustomColors.veryLightPink : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1,
              color: isSelected ? CustomColors.orangeSalmon : Colors.grey.shade300,
            ),
          ),
          child: Text(
            coffeeName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? CustomColors.orangeSalmon : CustomColors.plantation,
            ),
          ),
        ),
      ),
    );
  }
}
