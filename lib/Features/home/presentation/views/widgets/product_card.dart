import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themar_app/Features/home/data/models/product.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/image_card.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key, required this.aspectRation, required this.product});
  final double aspectRation;
  final Product product;
  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductsCubit>().products;
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
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(17)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: REdgeInsets.only(top: 10.h, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            imageCard(product.mainImage),
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
                          product.title ?? "",
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
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(
                                    'ر.س',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: AppTheme.colorPrimary,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        decorationColor: AppTheme.colorPrimary),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fill,
                                  child: Text(
                                    product.price.toString(),
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: AppTheme.colorPrimary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: AppTheme.colorPrimary),
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
                                    product.priceBeforeDiscount.toString(),
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
    );
  }

  Widget addButton() {
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
