import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personalIfomration/camera_tile.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/delivery_personal_info_page.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/core/components/car_info_section.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInfoForm extends StatelessWidget {
  const CarInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CarInoCameraSection(),
        AuthFormField(
            label: 'صورة رخصة القيادة',
            icon: SvgPicture.asset(AppImages.car),
            valueKey: 0),
        AuthFormField(
            label: "مودل السيارة",
            icon: SvgPicture.asset(AppImages.car),
            valueKey: 0),
        AuthFormField(
            label: 'رقم الإيبان',
            icon: Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: AppTheme.colorText2,
                    border: Border.all(color: Colors.grey.shade700)),
                child: SvgPicture.asset(AppImages.car)),
            valueKey: 0),
        AuthFormField(
            label: "إسم البنك",
            icon: SvgPicture.asset(AppImages.bank_building),
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
    );
  }
}
