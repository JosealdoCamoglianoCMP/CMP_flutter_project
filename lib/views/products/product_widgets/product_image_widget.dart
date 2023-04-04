import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    super.key,
    required this.url,
    this.witdh = 400,
    this.height = 400,
  });
  final String url;
  final double? witdh;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: witdh,
      height: height,
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
