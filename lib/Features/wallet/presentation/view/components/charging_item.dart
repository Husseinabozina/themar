import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/bagcard_page.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/reyal_text.dart';

class ChargingItem extends StatelessWidget {
  const ChargingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
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
                  Space(
                    height: 0,
                    width: 6,
                  ),
                  SvgPicture.asset(AppImages.arrow_to_buttonLift)
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 35.w),
            child: ReyalPriceText(
                mainAxisAlignment: MainAxisAlignment.end,
                price: 255,
                fontSize: AppTheme.font24,
                fontweight: AppTheme.FontWeightBold,
                fontcolor: AppTheme.colorPrimary),
          ),
        ],
      ),
    );
  }
}
