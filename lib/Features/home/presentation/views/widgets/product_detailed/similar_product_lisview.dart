import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/similar_product_card.dart';

class SimilarProductsListView extends StatelessWidget {
  const SimilarProductsListView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.only(right: 30),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SimilarProductCard(
              aspectRation: 1 / 1.2,
              product: ProductModel(
                  name: product.name,
                  priceAfter: product.priceAfter,
                  priceBefore: product.priceBefore)),
        ),
      ),
    );
  }
}
