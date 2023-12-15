import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField(
      {super.key,
      required this.label,
      required this.icon,
      this.isEnabled,
      this.valueKey,
      this.controller,
      this.validator});
  final String label;
  final Widget icon;
  final bool? isEnabled;
  final int? valueKey;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
          textAlign: TextAlign.right,
          validator: validator,
          controller: controller ?? null,
          key: ValueKey(valueKey),
          enabled: isEnabled ?? true,
          cursorColor: AppTheme.colorPrimary,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            filled: isEnabled == false ? true : false,
            fillColor: isEnabled == false ? const Color(0xFFFAFFF5) : null,
            label: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(label),
            ),
            alignLabelWithHint: true,
            floatingLabelStyle: const TextStyle(color: AppTheme.colorPrimary),
            prefixIcon:
                Padding(padding: const EdgeInsets.only(right: 10), child: icon),
            prefixIconConstraints: const BoxConstraints(),
            contentPadding: const EdgeInsets.all(20),
            focusColor: AppTheme.colorPrimary,
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    width: 1,
                    color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
