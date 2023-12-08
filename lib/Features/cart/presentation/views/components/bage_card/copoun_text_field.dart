import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CobounTextField extends StatelessWidget {
  const CobounTextField({super.key, this.icon});
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextField(
          showCursor: false,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconConstraints: const BoxConstraints(),
            hintStyle: AppTheme.Font15Text2LightStyle(),
            hintTextDirection: TextDirection.rtl,
            contentPadding: const EdgeInsets.only(top: 30),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15).r),
            hintText: "عند كوبون ؟ ادخل رقم الكوبون",
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: const TextStyle(color: AppTheme.colorPrimary),
            suffixIconConstraints: const BoxConstraints(),
            fillColor: Colors.white,
            filled: true,
          )),
    );
  }
}
