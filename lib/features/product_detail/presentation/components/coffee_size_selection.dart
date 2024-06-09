import 'package:coffee_shop_360/features/product_detail/presentation/widgets/coffee_size_chip_button.dart';
import 'package:flutter/material.dart';

class CoffeeSizeSelection extends StatefulWidget {
  final List<String?> coffeeNames;

  const CoffeeSizeSelection({super.key, required this.coffeeNames});

  @override
  State<CoffeeSizeSelection> createState() => _CoffeeSizeSelectionState();
}

class _CoffeeSizeSelectionState extends State<CoffeeSizeSelection> {
  String selectedCoffee = 'S';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(children: _buildCoffeeButtons()),
    );
  }

  List<Widget> _buildCoffeeButtons() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.coffeeNames.length; i++) {
      String? coffeeName = widget.coffeeNames[i];
      if (coffeeName != null) {
        buttons.add(
          CoffeeSizeChipButton(
            coffeeName: coffeeName,
            isSelected: coffeeName == selectedCoffee,
            onTap: () => setState(() => selectedCoffee = coffeeName),
          ),
        );
        if (i < widget.coffeeNames.length - 1) {
          buttons.add(const SizedBox(width: 8));
        }
      }
    }
    return buttons;
  }
}
