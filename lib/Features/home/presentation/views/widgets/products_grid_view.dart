import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';

class ProductCardsGridView extends StatelessWidget {
  const ProductCardsGridView(
      {super.key, required this.itemCount, required this.aspectRacio});
  final int itemCount;

  final double aspectRacio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: aspectRacio,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          crossAxisSpacing: 5),
      itemBuilder: (context, index) => ProductCard(
        aspectRation: aspectRacio,
        product: ProductModel(
            name: 'طماطم', priceAfter: 45, priceBefore: 56, id: '125463'),
      ),
    );
  }
}
