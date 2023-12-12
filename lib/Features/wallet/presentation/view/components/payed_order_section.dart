import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/reyal_text.dart';

class PayedOrderItem extends StatelessWidget {
  const PayedOrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 11.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'data',
                style: AppTheme.Font14Text2LightStyle(),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'شحن المحفظة ',
                      style: AppTheme.Font15PrimaryBoldStyle(),
                    ),
                  ),
                  const Space(
                    height: 0,
                    width: 10,
                  ),
                  SvgPicture.asset(AppImages.arrow_To_topRight)
                ],
              )
            ],
          ),
          const Space(height: 20),
          Container(
            height: 83.h,
            width: double.infinity,
            padding: EdgeInsets.only(left: 16.w, right: 11.w, top: 9.h),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'طلب #4587',
                    style: AppTheme.Font13PrimaryBoldStyle(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ReyalPriceText(
                          mainAxisAlignment: MainAxisAlignment.start,
                          price: 180,
                          fontSize: AppTheme.font13,
                          fontweight: AppTheme.FontWeightExtraBold,
                          fontcolor: AppTheme.colorPrimary),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 3),
                            decoration: BoxDecoration(
                                color: AppTheme.colorPrimarylight,
                                borderRadius: BorderRadius.circular(7)),
                            height: 25.h,
                            width: 25.w,
                            child: Center(
                              child: Text(
                                '+3',
                                textAlign: TextAlign.center,
                                style: AppTheme.Font11PrimaryBoldStyle(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7)),
                                height: 25.h,
                                width: 25.w,
                                child: Image.asset(AppImages.tomato),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
