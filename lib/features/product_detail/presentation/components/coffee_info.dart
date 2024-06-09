import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CoffeeInfo extends StatelessWidget {
  final String? title;
  final String? imagePath;
  final String? coffeeIngredients;

  const CoffeeInfo({
    super.key,
    this.title,
    this.imagePath,
    this.coffeeIngredients,
  });

  @override
  Widget build(BuildContext context) {
    String beanImageUrl = 'assets/png/bean.png';
    String milkImageUrl = 'assets/png/milk.png';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildImageContainer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    title ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "with ${coffeeIngredients ?? "-"}",
                    style: TextStyle(
                      color: CustomColors.starDust,
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildScore(),
                ],
              ),
            ),
            _buildIngredientsImages(beanImageUrl, milkImageUrl)
          ],
        ),
      ],
    );
  }

  Row _buildIngredientsImages(String beanImageUrl, String milkImageUrl) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColors.forgetMeNot,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(10),
          child: Image(
            width: 24,
            height: 24,
            image: AssetImage(beanImageUrl),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.forgetMeNot,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(10),
          child: Image(
            width: 24,
            height: 24,
            image: AssetImage(milkImageUrl),
          ),
        )
      ],
    );
  }

  Container _buildImageContainer() {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: imagePath != null
          ? CachedNetworkImage(
              height: 230,
              imageUrl: imagePath!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : const Placeholder(),
    );
  }

  Row _buildScore() {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.yellow,
        ),
        const SizedBox(width: 8),
        const Text(
          "4.8",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "(230)",
          style: TextStyle(
            fontSize: 12,
            color: CustomColors.dune,
          ),
        ),
      ],
    );
  }
}
