import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
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
                                  width: 54.w,
                                  height: 20.h,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                        color: AppTheme.colorPrimary,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(11),
                                            topLeft: Radius.circular(11))),
                                    child: Text(
                                      '-45%',
                                      textAlign: TextAlign.center,
                                      style: AppTheme.Font14Text3BoldStyle(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            product.name,
                            style: AppTheme.Font16PrimaryBoldStyle(),
                          ),
                          Text(
                            'السعر /1كجم',
                            style: AppTheme.Font12Text2LightStyle(),
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
                                          fontSize: 12,
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
                                          fontSize: 12,
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
                                      style: AppTheme.Font16PrimaryBoldStyle(),
                                    ),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Text(
                                      product.priceBefore.toString(),
                                      style: AppTheme.Font16PrimaryBoldStyle(),
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
      height: 117.h,
      width: 145.w,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.tomato)))),
    );
  }

  SizedBox addButton() {
    return SizedBox(
      height: 30.h,
      width: 30.w,
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
