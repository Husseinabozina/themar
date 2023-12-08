import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_back_button.dart';
import 'package:themar_app/core/widgets/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailedPageAppBar extends StatelessWidget {
  const ProductDetailedPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 15).r,
      child: SizedBox(
        width: 1.sw - 35.w,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              icon: AppImages.heart,
              color: AppTheme.colorPrimarylight,
            ),
            CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
