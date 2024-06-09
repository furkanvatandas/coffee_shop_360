import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:coffee_shop_360/features/product_detail/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CoffeePrice extends StatelessWidget {
  final String? price;

  const CoffeePrice({super.key, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(
            color: CustomColors.greenWhite,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(color: CustomColors.starDust),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$ $price",
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.orangeSalmon,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
              child: CustomButton(
            title: 'Buy Now',
            onTap: () {},
          ))
        ],
      ),
    );
  }
}
