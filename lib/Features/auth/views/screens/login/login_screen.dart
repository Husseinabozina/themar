import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String loginText = 'تسجيل الدخول';
  String haveAccountText = 'لديك حساب بالفعل';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          groupSvg(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40).w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: 'logo',
                    child: SvgPicture.asset(
                      AppImages.logo,
                      height: 0.1584.sh,
                      width: 0.3461.sw,
                      // width: 129.83.w,
                      // height: 125.72.h,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مرحبا بك مرة أخري ',
                        textAlign: TextAlign.end,
                        style: AppTheme.Font16PrimaryBoldStyle(),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'يمكنك تسجيل الدخول اللان',
                        key: const ValueKey("login"),
                        style: AppTheme.Font16Text2LightStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          child: Column(children: [
                        const PhoneNumberField(),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthFormField(
                          valueKey: 5,
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
                      ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRoutes.resetPasswordScreen);
                        },
                        child: Text(
                          'نسيت كلمة المرور ؟',
                          style: AppTheme.Font16Text2LightStyle(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomButton(
                    title: Text(
                      'تسجيل الدخول',
                      style: AppTheme.Font15Text3BoldStyle(),
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.homeScreen);
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRoutes.deliverRegisterScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل الأن",
                          style: AppTheme.Font18PrimaryBoldStyle(),
                        ),
                        Text(
                          'ليس لديك حساب ؟',
                          style: AppTheme.Font15PrimaryBoldStyle(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
