import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CoffeeTextField extends StatefulWidget {
  final void Function(String)? onChanged;

  const CoffeeTextField({super.key, this.onChanged});

  @override
  State<CoffeeTextField> createState() => _CoffeeTextFieldState();
}

class _CoffeeTextFieldState extends State<CoffeeTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: CustomColors.dune,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          style: TextStyle(color: CustomColors.starDust),
          controller: controller,
          onChanged: widget.onChanged,
          textAlignVertical: TextAlignVertical.center,
          decoration: _decoration(),
        ),
      ),
    );
  }

  InputDecoration _decoration() {
    return InputDecoration(
      hintText: 'Search coffee',
      hintStyle: TextStyle(color: CustomColors.starDust),
      border: InputBorder.none,
      prefixIcon: const Icon(Icons.search, color: Colors.white),
      suffixIcon: Container(
        decoration: BoxDecoration(
          color: CustomColors.orangeSalmon,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.tune,
          color: Colors.white,
        ),
      ),
    );
  }
}
