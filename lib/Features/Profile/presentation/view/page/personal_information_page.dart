import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const CustomNamedAppBar(
              name: 'البيانات الشخصية',
            ),
            const Space(height: 35),
            Container(
              height: 83.h,
              width: 88.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.tomato))),
            ),
            Text(
              'محمد علي',
              style: AppTheme.Font17PrimaryBoldStyle(),
            ),
            Text(
              '+5454844534',
              style: AppTheme.Font17Text2BoldStyle(),
            ),
            SizedBox(height: 20),
            AuthFormField(
              valueKey: 4,
              label: usernameText,
              icon: SvgPicture.asset(
                AppImages.user_grey,
                height: 25.h,
                width: 25.w,
              ),
            ),
            SizedBox(height: 20),
            PhoneNumberField(),
            SizedBox(height: 20),
            AuthFormField(
              valueKey: 3,
              label: cityText,
              icon: SvgPicture.asset(
                AppImages.flag_grey,
                height: 25.h,
                width: 25.w,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthFormField(
              valueKey: 5,
              label: passwordText,
              icon: SvgPicture.asset(
                AppImages.unlock,
                height: 25.h,
                width: 25.w,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                  title: Text(
                    'تعديل البيانات',
                    style: AppTheme.Font15Text3BoldStyle(),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
