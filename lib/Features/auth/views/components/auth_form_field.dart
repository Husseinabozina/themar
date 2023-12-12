import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField(
      {super.key,
      required this.label,
      required this.icon,
      this.isEnabled,
      required this.valueKey,
      this.controller});
  final String label;
  final Widget icon;
  final bool? isEnabled;
  final int valueKey;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: TextFormField(
          controller: controller ?? null,
          key: ValueKey(valueKey),
          enabled: isEnabled ?? true,
          cursorColor: AppTheme.colorPrimary,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            filled: isEnabled == false ? true : false,
            fillColor: isEnabled == false ? const Color(0xFFFAFFF5) : null,
            label: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(label)],
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            floatingLabelStyle: const TextStyle(color: AppTheme.colorPrimary),
            suffixIcon:
                Padding(padding: const EdgeInsets.only(right: 10), child: icon),
            suffixIconConstraints: const BoxConstraints(),
            contentPadding: const EdgeInsets.all(20),
            focusColor: AppTheme.colorPrimary,
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    width: 1,
                    color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    width: 1,
                    color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
