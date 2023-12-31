import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_Images_views.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/amount_section_listview.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_view_navbar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/rating_listview.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/similar_product_lisview.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_detailed_page_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          ProductDetailedBottomNav(ctx: context, product: product),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ProductImagesViews(),
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
                    'كود المنتج',
                    style: AppTheme.Font17PrimaryBoldStyle(),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    '''هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.
                  ''',
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
            SizedBox(
              height: 87,
              child: RatingListView(),
            ),
            Text(
              'منتجات مشابهة',
              style: AppTheme.Font17PrimaryBoldStyle(),
            ),
            SizedBox(
              height: 10.h,
            ),
            SimilarProductsListView(product: product)
          ],
        ),
      ),
    );
  }
}
