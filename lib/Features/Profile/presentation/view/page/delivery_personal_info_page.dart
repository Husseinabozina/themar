import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personalIfomration/camera_tile.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/orders/presentation/views/components/toggleBottom.dart';
import 'package:themar_app/core/components/car_info_section.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliverPersonalInfomration extends StatelessWidget {
  const DeliverPersonalInfomration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  CustomNamedAppBar(
                    name: (state is CarInfo)
                        ? 'بيانات السيارة'
                        : 'البيانات الشخصية',
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
                  const Space(
                    height: 28,
                  ),
                  AnimatedToggleButtom(
                    onTap: cubit.toggleInfo,
                    leftTitle: 'بيانات السيارة',
                    rightTitle: "البيانات الشخصية",
                  ),
                  const Space(
                    height: 16,
                  ),
                  if (state is CarInfo) CarInoCameraSection(),
                  const Space(
                    height: 25,
                  ),
                  AuthFormField(
                    valueKey: 4,
                    isEnabled: false,
                    label: "اسم المستخدم",
                    icon: SvgPicture.asset(
                      AppImages.unlock,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PhoneNumberField(
                    isEnabled: false,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthFormField(
                    isEnabled: false,
                    valueKey: 3,
                    label: "المدينة",
                    icon: SvgPicture.asset(
                      AppImages.unlock,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthFormField(
                    isEnabled: false,
                    valueKey: 6,
                    label: 'كلمة المرور',
                    icon: SvgPicture.asset(
                      AppImages.unlock,
                      height: 25.h,
                      width: 25.w,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.homeScreen);
                    },
                    title: Text(
                      'تعديل البيانات',
                      style: AppTheme.Font16Text3BoldStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: Text(label)),
                    Expanded(child: Text(label)),
                  ],
                ),
              ],
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            alignLabelWithHint: true,
            floatingLabelStyle: const TextStyle(color: AppTheme.colorPrimary),
            suffixIcon:
                Padding(padding: const EdgeInsets.only(right: 10), child: icon),
            suffixIconConstraints: const BoxConstraints(),
            contentPadding: const EdgeInsets.all(20),
            focusColor: AppTheme.colorPrimary,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
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
