import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(),
      padding: EdgeInsets.all(6).w,
      height: 33.h,
      width: 32.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppTheme.colorPrimarylight),
      child: SvgPicture.asset(
        icon,
        height: 8.h,
        width: 8.w,
      ),
    );
  }
}
