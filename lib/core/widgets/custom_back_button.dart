import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pop();
      },
      child: Container(
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(6).w,
        height: 33.h,
        width: 32.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppTheme.colorPrimarylight),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
          color: AppTheme.colorPrimary,
        ),
      ),
    );
  }
}
