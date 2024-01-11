import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      this.icon,
      this.hintText,
      this.onTap,
      this.isEnabled,
      this.controller,
      this.onChanged});
  final Widget? icon;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(BuildContext context)? onTap;
  final bool? isEnabled;
  final Function(String text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextField(
          textInputAction: TextInputAction.search,
          controller: controller,
          onChanged: onChanged,
          enabled: isEnabled ?? false,
          onTap: () {},
          cursorColor: AppTheme.colorPrimary,
          textDirection: TextDirection.rtl,
          cursorOpacityAnimates: true,
          decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconConstraints: const BoxConstraints(),
            hintStyle: AppTheme.Font15Text2LightStyle(),
            hintTextDirection: TextDirection.rtl,
            contentPadding: const EdgeInsets.only(top: 30),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15).r),
            hintText: hintText ?? "ابحث عن ما تريد؟",
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            floatingLabelStyle: const TextStyle(color: AppTheme.colorPrimary),
            suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: SvgPicture.asset(AppImages.search)),
            suffixIconConstraints: const BoxConstraints(),
            // contentPadding: REdgeInsets.all(10).w,
            focusColor: AppTheme.colorPrimary,
            fillColor: AppTheme.colorPrimarylight.withOpacity(0.4),
            filled: true,
          )),
    );
  }
}
