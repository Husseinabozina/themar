import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomNamedAppBar(
            name: 'البيانات الشخصية',
          ),
          Space(height: 35),
          Container(
            height: 83.h,
            width: 88.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: AssetImage(AppImages.tomato))),
          ),
          Text(
            'محمد علي',
            style: AppTheme.Font17PrimaryBoldStyle(),
          ),
          Text(
            '+5454844534',
            style: AppTheme.Font17Text2BoldStyle(),
          ),
          AuthFormField1(
              label: 'label',
              icon: SvgPicture.asset(AppImages.profile),
              valueKey: 34)
        ],
      ),
    );
  }
}

class AuthFormField1 extends StatelessWidget {
  const AuthFormField1(
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
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: Text(label)),
                      Expanded(child: Text(label)),
                    ],
                  ),
                ),
              ],
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
