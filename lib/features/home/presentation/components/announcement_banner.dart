import 'package:coffee_shop_360/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AnnouncementBanner extends StatelessWidget {
  const AnnouncementBanner({super.key});

  @override
  Widget build(BuildContext context) {
    String bannerImageUrl = 'assets/images/banner_1.jpg';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image(image: AssetImage(bannerImageUrl)),
            Container(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.valentineRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                    child: const Text(
                      "Promo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text(
                    "Buy one get\none Free",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
