import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SimilarProductCard extends StatelessWidget {
  const SimilarProductCard(
      {super.key, required this.aspectRation, required this.product});
  final double aspectRation;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRoutes.productDetailedPage, extra: product);
      },
      child: SizedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(17).r),
          child: Padding(
            padding: const EdgeInsets.all(5).r,
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(17)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(top: 10, right: 10).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              imageCard(),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 43.w,
                                  height: 16.h,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: AppTheme.colorPrimary,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(11),
                                            topLeft: Radius.circular(11))),
                                    child: Text(
                                      '-45%',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: AppTheme.FontWeightBold,
                                          fontSize: AppTheme.font11,
                                          color: AppTheme.colorText3),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            product.name,
                            style: TextStyle(
                                fontWeight: AppTheme.FontWeightBold,
                                fontSize: AppTheme.font13,
                                color: AppTheme.colorPrimary),
                          ),
                          Text(
                            'السعر /1كجم',
                            style: TextStyle(
                                fontWeight: AppTheme.FontWeightLight,
                                fontSize: AppTheme.font10,
                                color: AppTheme.colorText2),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              addButton(),
                              Row(
                                children: [
                                  const FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      'ر.س',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: AppTheme.colorPrimary,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          decorationColor:
                                              AppTheme.colorPrimary),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      product!.priceBefore!.toString(),
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: AppTheme.colorPrimary,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor:
                                              AppTheme.colorPrimary),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      'ر.س',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontWeight: AppTheme.FontWeightBold,
                                          fontSize: AppTheme.font13,
                                          color: const Color.fromARGB(
                                              255, 26, 29, 23)),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      product.priceAfter.toString(),
                                      style: TextStyle(
                                          fontWeight: AppTheme.FontWeightBold,
                                          fontSize: AppTheme.font13,
                                          color: const Color.fromARGB(
                                              255, 26, 29, 23)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    if (aspectRation == 1 / 1.5)
                      SizedBox(
                        height: 30.h,
                        width: 115.w,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: AppTheme.colorPrimary,
                                borderRadius: BorderRadius.circular(10).r),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'أضف للسلة',
                                  style: AppTheme.Font12Text3BoldStyle(),
                                ))),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox imageCard() {
    return SizedBox(
      height: 94.h,
      width: 116.w,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.tomato)))),
    );
  }

  SizedBox addButton() {
    return SizedBox(
      height: 24.h,
      width: 24.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppTheme.colorPrimary2),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
