import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FiltersIcon extends StatelessWidget {
  const FiltersIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 40.h,
      width: 40.h,
      decoration: BoxDecoration(
          color: AppTheme.colorPrimary,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(7),
      child: SvgPicture.asset(AppImages.filters),
    );
  }
}
