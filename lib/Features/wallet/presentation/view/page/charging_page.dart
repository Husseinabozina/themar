import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';

class ChargingPage extends StatelessWidget {
  const ChargingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomNamedAppBar(name: 'شحن الان'),
            SizedBox(
              height: 67.h,
            ),
            Text(
              'معلومات المبلغ',
              style: AppTheme.Font15PrimaryBoldStyle(),
            ),
            const SizedBox(height: 22),
            const FilledCustomTextField(hinTtext: 'المبلغ الخاص بك'),
            const Space(height: 40),
            Text(
              'معلومات البطاقة',
              style: AppTheme.Font15PrimaryBoldStyle(),
            ),
            const SizedBox(height: 22),
            const FilledCustomTextField(hinTtext: 'الاسم'),
            const SizedBox(height: 20),
            const FilledCustomTextField(hinTtext: "رقم البطاقة الائتمانية"),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                    child: FilledCustomTextField(
                  hinTtext: 'الرقم المتسلسل',
                )),
                SizedBox(width: 20),
                Expanded(
                    child: FilledCustomTextField(
                  hinTtext: 'تاريخ الانتهاء',
                )),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            CustomButton(
              title: Text(
                'دفع',
                style: AppTheme.Font15Text3BoldStyle(),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class FilledCustomTextField extends StatelessWidget {
  const FilledCustomTextField({super.key, this.hinTtext});
  final String? hinTtext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextField(
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintStyle:
                AppTheme.Font15Text2LightStyle(color: const Color(0xFFAFAFAF)),
            hintTextDirection: TextDirection.rtl,
            contentPadding: const EdgeInsets.only(top: 30, right: 20),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15).r,
                borderSide:
                    const BorderSide(color: Color(0xFF8AC253), width: 0.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15).r,
                borderSide:
                    const BorderSide(color: Color(0xFF8AC253), width: 0.5)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15).r,
                borderSide: const BorderSide()),
            hintText: hinTtext,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            focusColor: AppTheme.colorPrimary,
            fillColor: const Color(0xFFFAFFF5),
            filled: true,
          )),
    );
  }
}
