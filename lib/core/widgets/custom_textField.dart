import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';

class customTextField extends StatelessWidget {
  const customTextField({super.key, required this.hintText, this.maxlines});
  final String? hintText;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxlines ?? 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFDCDCDC)),
            borderRadius: BorderRadius.circular(10).r),
        hintText: hintText,
        hintStyle: AppTheme.Font12Text2LightStyle(),
        hintTextDirection: TextDirection.rtl,
      ),
    );
  }
}
