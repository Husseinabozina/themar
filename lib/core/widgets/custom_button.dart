import 'package:flutter/material.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, required this.onPressed, this.height});

  final Widget? title;
  final void Function() onPressed;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 60,
        width: double.infinity,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: AppTheme.colorPrimary,
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
                onPressed: onPressed,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    child: title))));
  }
}
