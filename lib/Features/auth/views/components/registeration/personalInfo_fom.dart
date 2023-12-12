import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoForm extends StatelessWidget {
  const PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        AuthFormField(
            label: 'اسم المندوب',
            icon: SvgPicture.asset(AppImages.user_grey),
            valueKey: 0),
        PhoneNumberField(),
        AuthFormField(
            label: "المدينة",
            icon: SvgPicture.asset(AppImages.flag_grey),
            valueKey: 0),
        AuthFormField(
            label: "تحديد الموقع علي الخريطة",
            icon: SvgPicture.asset(AppImages.location_grey_solid),
            valueKey: 0),
        AuthFormField(
            label: "رقم الهوية",
            icon: SvgPicture.asset(AppImages.identification_grey),
            valueKey: 0),
        AuthFormField(
            label: "البريد الإلكتروني",
            icon: SvgPicture.asset(AppImages.email_grey),
            valueKey: 0),
        AuthFormField(
            label: "كلمة المرور",
            icon: SvgPicture.asset(AppImages.unlock),
            valueKey: 0),
        AuthFormField(
            label: "نتأكيد كلمة المرور",
            icon: SvgPicture.asset(AppImages.unlock),
            valueKey: 0),
        SizedBox(
          height: 20,
        ),
        CustomButton(
            title: Text('التالي', style: AppTheme.Font15Text3BoldStyle()),
            onPressed: () {
              RegisterCubit.get(context).completePeronalinfo();
            }),
        SizedBox(
          height: 30.h,
        ),
      ],
    ));
  }
}
