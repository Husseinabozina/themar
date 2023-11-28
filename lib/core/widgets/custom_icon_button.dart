import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.icon,
      required this.color,
      this.height,
      this.width,
      this.onTap});
  final String icon;
  final Color color;
  final double? height;
  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        constraints: BoxConstraints(),
        padding: EdgeInsets.all(6).w,
        height: height?.h ?? 33.h,
        width: width?.w ?? 32.w,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(7), color: color),
        child: Center(
          child: SvgPicture.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
