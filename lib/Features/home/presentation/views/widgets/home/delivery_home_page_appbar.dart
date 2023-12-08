import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryHomePageAppBar extends StatelessWidget {
  const DeliveryHomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 30,
          width: 30,
        ),
        Text(
          'الرئيسية',
          style: AppTheme.Font20PrimaryBoldStyle(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'سلة ثمار',
              style: AppTheme.Font14PrimaryBoldStyle(),
            ),
            SizedBox(
              width: 5.w,
            ),
            SvgPicture.asset(
              AppImages.logo,
              height: 20.8.h,
              width: 20.29.w,
            ),
          ],
        )
      ],
    );
  }
}
