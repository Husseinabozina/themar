import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/product.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';

class ProductCardsGridView extends StatelessWidget {
  const ProductCardsGridView(
      {super.key,
      required this.itemCount,
      required this.aspectRacio,
      required this.products});
  final List<Product> products;
  final int itemCount;

  final double aspectRacio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: aspectRacio,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          crossAxisSpacing: 5),
      itemBuilder: (context, index) => ProductCard(
        aspectRation: aspectRacio,
        product: products[index],
      ),
    );
  }
}
