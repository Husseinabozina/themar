import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_back_button.dart';

class CategoryDetailedPageAppBar extends StatelessWidget {
  const CategoryDetailedPageAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.5.sw + 0.05.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                color: AppTheme.colorPrimary,
                fontSize: AppTheme.font20,
                fontWeight: AppTheme.FontWeightBold),
          ),
          CustomBackButton()
        ],
      ),
    );
  }
}
