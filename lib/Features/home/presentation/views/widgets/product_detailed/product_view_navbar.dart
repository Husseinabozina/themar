import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class ProductDetailedBottomNav extends StatelessWidget {
  const ProductDetailedBottomNav(
      {super.key, required this.product, required this.ctx});
  final ProductModel product;
  final BuildContext ctx;
  final String addToCardText = 'التحويل الي السلة';
  final String moreOffersText = 'تصفح العروض';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: ctx,
            builder: (context) {
              return Container(
                height: 202.h,
                width: 1.sw,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 10, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'تم أضافة المنتج بنجاح ',
                            style: AppTheme.Font14PrimaryBoldStyle(),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppTheme.colorPrimarylight),
                            child: Icon(
                              Icons.done,
                              size: 8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                product.name,
                                style: AppTheme.Font12PrimaryMediumStyle(),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4',
                                    style: AppTheme.Font12Text2LightStyle(),
                                  ),
                                  Text(
                                    ':',
                                    style: AppTheme.Font12Text2LightStyle(),
                                  ),
                                  Text(
                                    'الكمية',
                                    style: AppTheme.Font12Text2LightStyle(),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text('ر.س',
                                      style:
                                          AppTheme.Font16PrimaryMediumStyle()),
                                  Text('200',
                                      style:
                                          AppTheme.Font16PrimaryMediumStyle()),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 65.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.tomato))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

// ///////////////////////////////////////////////

                      Row(
                        children: [
                          bottomNavBottun(moreOffersText),
                          SizedBox(
                            width: 18.w,
                          ),
                          GestureDetector(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRoutes.bagCardPage);
                              },
                              child: bottomNavBottun(addToCardText)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 60.h,
        width: double.infinity,
        color: AppTheme.colorPrimary,
        child: Padding(
          padding: EdgeInsets.only(right: 25, left: 20, top: 10, bottom: 10).r,
          child: Row(
            children: [
              Text(
                "رس",
                style: AppTheme.Font15Text3BoldStyle(),
              ),
              Text(
                "225",
                style: AppTheme.Font15Text3BoldStyle(),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                'اضافة الي السلة',
                style: AppTheme.Font15Text3BoldStyle(),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 32.h,
                width: 35.w,
                padding: EdgeInsets.all(5),
                child: Image.asset(AppImages.shoppingCard),
                decoration: BoxDecoration(
                  color: AppTheme.colorPrimary3,
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomNavBottun(String title) {
    return SizedBox(
      height: 50.h,
      width: 162.65.w,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: title == moreOffersText
                  ? AppTheme.colorText3
                  : AppTheme.colorPrimary,
              border: Border.all(
                color: AppTheme.colorPrimary,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: () {},
              child: Text(
                title,
                style: title == moreOffersText
                    ? AppTheme.Font14PrimaryNormalStyle()
                    : AppTheme.Font14Text3BoldStyle(),
              ))),
    );
  }
}
