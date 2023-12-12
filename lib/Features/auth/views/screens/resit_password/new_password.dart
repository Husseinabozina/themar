import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          groupSvg(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40).w,
            child: Column(
              children: [
                SvgPicture.asset(
                  AppImages.logo,
                  height: 0.1584.sh,
                  width: 0.3461.sw,
                  // width: 129.83.w,
                  // height: 125.72.h,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      'نسيت كلمة المرور',
                      textAlign: TextAlign.end,
                      style: AppTheme.Font16PrimaryBoldStyle(),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'أدخل كلمةالمرور الجديدة',
                      key: const ValueKey("login"),
                      style: AppTheme.Font16Text2LightStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                        child: Column(
                      children: [
                        AuthFormField(
                          valueKey: 5,
                          label: 'كلمة المرور الجديدة',
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
                          valueKey: 5,
                          label: 'تأكيد كلمة المرور',
                          icon: SvgPicture.asset(
                            AppImages.unlock,
                            height: 25.h,
                            width: 25.w,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          title: Text(
                            "تغيير كلمة المرور",
                            style: AppTheme.Font15Text3BoldStyle(),
                          ),
                          onPressed: () {
                            GoRouter.of(context).push(AppRoutes.homeScreen);
                          },
                        ),
                        Space(height: 45),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push(AppRoutes.loginPage);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                loginText,
                                style: AppTheme.Font18PrimaryBoldStyle(),
                              ),
                              Text(
                                haveAccountText,
                                style: AppTheme.Font15PrimaryBoldStyle(),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
