import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthFormField extends StatelessWidget {
  const AuthFormField(
      {super.key,
      required this.label,
      required this.icon,
      this.isEnabled,
      required this.valueKey});
  final String label;
  final Widget icon;
  final bool? isEnabled;
  final int valueKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextFormField(
          key: ValueKey(valueKey),
          enabled: isEnabled ?? true,
          cursorColor: AppTheme.colorPrimary,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            label: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(label)],
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            floatingLabelStyle: TextStyle(color: AppTheme.colorPrimary),
            suffixIcon:
                Padding(padding: EdgeInsets.only(right: 10), child: icon),
            suffixIconConstraints: BoxConstraints(),
            contentPadding: EdgeInsets.all(20),
            focusColor: AppTheme.colorPrimary,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    width: 0.5,
                    color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
