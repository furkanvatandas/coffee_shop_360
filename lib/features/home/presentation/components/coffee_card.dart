import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:coffee_shop_360/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel? coffeeModel;
  final void Function()? onTapCoffeeCard;

  const CoffeeCard({
    super.key,
    this.coffeeModel,
    this.onTapCoffeeCard,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCoffeeCard,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(child: _buildImageArea()),
              const SizedBox(height: 6),
              _buildNameArea(),
              const SizedBox(height: 12),
              _buildPriceArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageArea() {
    var imagePath = coffeeModel?.image;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: imagePath != null
              ? CachedNetworkImage(
                  imageUrl: imagePath,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : const Placeholder(),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                SizedBox(width: 8),
                Text(
                  "4.8",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameArea() {
    var coffeeIngredients = "with ${coffeeModel?.coffeeIngredients}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          coffeeModel?.title ?? "",
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (coffeeModel?.coffeeIngredients != null)
          Text(
            coffeeIngredients,
            maxLines: 1,
            style: TextStyle(
              color: CustomColors.starDust,
              fontSize: 13,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }

  Widget _buildPriceArea() {
    var price = coffeeModel?.price;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$ $price",
          style: const TextStyle(
            fontSize: 18,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: CustomColors.orangeSalmon,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.add,
            size: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
