import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.height,
      this.hasBordered,
      this.color});

  final Widget? title;
  final void Function() onPressed;
  final double? height;
  final bool? hasBordered;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 60,
        width: double.infinity,
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: hasBordered == true
                    ? Border.all(
                        color: color ?? AppTheme.colorPrimary,
                      )
                    : null,
                color: color ??
                    ((hasBordered == true)
                        ? AppTheme.colorText3
                        : AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(17)),
            child: TextButton(
                onPressed: onPressed,
                child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 800),
                    child: title))));
  }
}
