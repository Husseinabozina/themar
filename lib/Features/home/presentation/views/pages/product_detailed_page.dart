import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/product.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_Images_views.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/amount_section_listview.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_view_navbar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/rating_listview.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/similar_product_lisview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            ProductDetailedBottomNav(ctx: context, product: product),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const ProductImagesViews(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AmountSection(product: product),
                        SizedBox(
                          height: 39.h,
                        ),
                        Text(
                          product.code!,
                          style: AppTheme.Font17PrimaryBoldStyle(),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          product.description!,
                          textDirection: TextDirection.rtl,
                          style: AppTheme.Font14Text2LightStyle(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'عرض الكل',
                              style: AppTheme.Font15PrimaryLightStyle(),
                            ),
                            Text(
                              'التقييمات',
                              style: AppTheme.Font17PrimaryBoldStyle(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 87,
                child: RatingListView(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'منتجات مشابهة',
                    style: AppTheme.Font17PrimaryBoldStyle(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SimilarProductsListView(
                      product: ProductModel(
                          name: product.title!,
                          priceAfter: 20,
                          priceBefore: 25,
                          id: '4'))
                ],
              ),
            )
          ],
        ));
  }
}
