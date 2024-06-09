import 'package:coffee_shop_360/features/home/presentation/widgets/coffee_chip_button.dart';
import 'package:flutter/material.dart';

class CoffeeSelection extends StatefulWidget {
  final List<String?> coffeeNames;

  const CoffeeSelection({super.key, required this.coffeeNames});

  @override
  State<CoffeeSelection> createState() => _CoffeeSelectionState();
}

class _CoffeeSelectionState extends State<CoffeeSelection> {
  String selectedCoffee = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        itemCount: widget.coffeeNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: _itemBuilder,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }

  Widget? _itemBuilder(context, index) {
    String? coffeeName = widget.coffeeNames[index];

    if (coffeeName != null) {
      return CoffeeChipButton(
        coffeeName: coffeeName,
        isSelected: coffeeName == selectedCoffee,
        onTap: () => setState(() => selectedCoffee = coffeeName),
      );
    }

    return const SizedBox();
  }
}
