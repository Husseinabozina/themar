import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/Features/auth/views/screens/login/login_screen.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String loginText = 'تسجيل الدخول';
    const String usernameText = 'اسم المستخدم';
    const String cityText = "المدينة";
    const String passwordText = 'كلمة المرور';
    const String ensurePasswordText = "تأكيد كلمة المرور";
    String haveAccountText = "لديك حساب بالفعل ؟";

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
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      final cubit = RegisterCubit.get(context);
                      return Column(
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
                              key: cubit.registerFormKey,
                              child: Column(children: [
                                AuthFormField(
                                  validator: (_) => cubit.validateUsername(),
                                  controller: cubit.userNameController,
                                  valueKey: 4,
                                  label: usernameText,
                                  icon: SvgPicture.asset(
                                    AppImages.unlock,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                                ),
                                PhoneNumberField(
                                  contorller: cubit.phoneNumberController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AuthFormField(
                                  validator: (_) => cubit.validateCity(),
                                  controller: cubit.cityController,
                                  valueKey: 3,
                                  label: cityText,
                                  icon: SvgPicture.asset(
                                    AppImages.unlock,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AuthFormField(
                                  validator: (_) => cubit.validatePassword(),
                                  controller: cubit.passwordController,
                                  valueKey: 5,
                                  label: passwordText,
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
                                  validator: (_) =>
                                      cubit.validateRenterPassword(),
                                  controller: cubit.renterPasswordController,
                                  valueKey: 5,
                                  label: ensurePasswordText,
                                  icon: SvgPicture.asset(
                                    AppImages.unlock,
                                    height: 25.h,
                                    width: 25.w,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            AppRoutes.resetPasswordScreen);
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
                                  onPressed: () => cubit.register(context),
                                ),
                              ]))
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  InkWell(
                    onTap: () {},
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}























// AnimatedContainer(
//                           height: _authMode == AuthMode.signUp
//                               ? maxHeight
//                               : minHeight,
//                           curve: Curves.ease,
//                           duration: const Duration(milliseconds: 1000),
//                           constraints: BoxConstraints(
//                               maxHeight: maxHeight, minHeight: minHeight),
//                           child: SingleChildScrollView(
//                             child: Container(
//                               constraints: const BoxConstraints(maxHeight: 76),
//                               child: Column(
//                                 children: [
//                                   AuthFormField(
//                                     valueKey: 4,
//                                     isEnabled: _authMode == AuthMode.signUp,
//                                     label: "اسم المستخدم",
//                                     icon: SvgPicture.asset(
//                                       AppImages.unlock,
//                                       height: 25.h,
//                                       width: 25.w,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )

//   المدينة
//                         AnimatedContainer(
//                           height: _authMode == AuthMode.signUp
//                               ? maxHeight
//                               : minHeight,
//                           curve: Curves.ease,
//                           duration: const Duration(milliseconds: 1000),
//                           constraints: BoxConstraints(
//                               maxHeight: maxHeight, minHeight: minHeight),
//                           child: SingleChildScrollView(
//                             child: FadeTransition(
//                               opacity: animation,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   AuthFormField(
//                                     valueKey: 3,
//                                     isEnabled: _authMode == AuthMode.signUp,
//                                     label: "المدينة",
//                                     icon: SvgPicture.asset(
//                                       AppImages.unlock,
//                                       height: 25.h,
//                                       width: 25.w,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )