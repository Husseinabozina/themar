import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField(
      {super.key, this.isEnabled, this.contorller, this.validate});
  final bool? isEnabled;
  final TextEditingController? contorller;
  final String? Function(String? text)? validate;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InternationalPhoneNumberInput(
        validator: validate,
        textAlign: TextAlign.right,
        textFieldController: contorller,
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        formatInput: false,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        onInputChanged: (PhoneNumber value) {},
        inputDecoration: InputDecoration(
            label: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: const Text('رقم الهاتف'),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10)),
            enabled: (isEnabled == false) ? false : true,
            prefixIconConstraints: const BoxConstraints(),
            prefixIcon: Padding(
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
                borderSide:
                    const BorderSide(width: 1, color: AppTheme.colorPrimary),
                borderRadius: BorderRadius.circular(10).r),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10).r)),
      ),
    );
  }
}
