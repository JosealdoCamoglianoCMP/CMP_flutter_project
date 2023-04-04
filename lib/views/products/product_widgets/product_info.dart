import 'package:cmp_flutter_web/models/product.dart';
import 'package:cmp_flutter_web/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.product,
    required this.width,
  });
  final Product product;
  final double width;
  @override
  Widget build(BuildContext context) {
    if (width <= 700) {
      return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.lightBlueColor,
                ),
              ),
              Text(
                product.sku,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ));
    } else {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 464,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.lightBlueColor,
              ),
            ),
            Text(
              product.sku,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      );
    }
  }
}
