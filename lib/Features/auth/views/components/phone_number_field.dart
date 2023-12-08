import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key, this.isEnabled});
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      selectorConfig: const SelectorConfig(),
      onInputChanged: (PhoneNumber value) {},
      inputDecoration: InputDecoration(
          enabled: (isEnabled == false) ? false : true,
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              AppImages.phone,
              height: 25.h,
              width: 25.h,
            ),
          ),
          contentPadding: const EdgeInsets.all(20),
          focusColor: AppTheme.colorPrimary,
          filled: isEnabled == false ? true : false,
          fillColor: isEnabled == false ? const Color(0xFFFAFFF5) : null,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.5, color: AppTheme.colorPrimary),
              borderRadius: BorderRadius.circular(10).r),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10).r)),
    );
  }
}
