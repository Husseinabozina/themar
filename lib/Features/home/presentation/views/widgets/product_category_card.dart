import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCategoryCard extends StatelessWidget {
  const ProductCategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(17)),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(17)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            SizedBox(
                              height: 117.h,
                              width: 145.w,
                              child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              AssetImage(AppImages.tomato)))),
                            ),
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
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(5))),
                                  child: Text(
                                    '-45%',
                                    style: AppTheme.Font14Text3BoldStyle(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        Text(
                          'طماطم',
                          style: AppTheme.Font16PrimaryBoldStyle(),
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        Text(
                          'السعر /1كجم',
                          style: AppTheme.Font12Text2LightStyle(),
                        ),
                        // SizedBox(
                        //   height: 5.h,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30.h,
                              width: 30.w,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.colorPrimary),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'ر.س' + '56',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: AppTheme.colorPrimary),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  '45',
                                  style: AppTheme.Font16PrimaryBoldStyle(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
