import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/aditional/data/models/iqLocation_model/iqlocaiton_model.dart';
import 'package:themar_app/Features/aditional/manager/cubit/additional_cubit.dart';
import 'package:themar_app/Features/aditional/view/components.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/Features/auth/views/screens/login/login_screen.dart';
import 'package:themar_app/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/Networking/api/api_const.dart';
import 'package:themar_app/core/components/showToast.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                      if (state is RegisterSuccess) {
                        showToast(
                            message: ' Register done successfully',
                            state: ToastStates.success);
                      } else if (state is RegisterFailure) {
                        showToast(
                            message: ' Register failed',
                            state: ToastStates.error);
                      } else if (state is RegisterLoading) {
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final cubit = RegisterCubit.get(context);
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(context
                                  .read<AdditionalCubit>()
                                  .cities
                                  .length);
                            },
                            child: Text(
                              'مرحبا بك مرة أخري ',
                              textAlign: TextAlign.end,
                              style: AppTheme.Font16PrimaryBoldStyle(),
                            ),
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
                                const CitiesTextFormField(),
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
                                    'التسجيل',
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
                    onTap: () {
                      GoRouter.of(context).pop();
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CitiesTextFormField extends StatefulWidget {
  const CitiesTextFormField({super.key});

  @override
  State<CitiesTextFormField> createState() => CitiesTextFormFieldState();
}

class CitiesTextFormFieldState extends State<CitiesTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalCubit, AdditionalState>(
      builder: (context, state) {
        return Column(
          children: [
            AuthFormField(
              isReadOnly: true,
              suffixIcon: DropdownButton(
                onChanged: (newValue) {
                  context.read<RegisterCubit>().assignCityController(newValue);
                  print('e');
                },
                items: List.generate(
                    context.read<AdditionalCubit>().cities.length,
                    (index) => DropdownMenuItem(
                        value: context
                            .read<AdditionalCubit>()
                            .cities[index]
                            .cityName,
                        child: Text(context
                            .read<AdditionalCubit>()
                            .cities[index]
                            .cityName))),
              ),
              validator: (_) => context.read<RegisterCubit>().validateCity(),
              controller: context.read<RegisterCubit>().cityController,
              valueKey: 3,
              label: cityText,
              icon: SvgPicture.asset(
                AppImages.unlock,
                height: 25.h,
                width: 25.w,
              ),
            ),
            // Stack(
            //   children: [
            //     ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: locations.length,
            //         itemBuilder: (context, index) =>
            //             LocationListTile(
            //               location: context
            //                   .read<
            //                       AdditionalCubit>()
            //                   .cities[index]
            //                   .cityName,
            //               press: () {},
            //             ))
            //   ],
            // )
          ],
        );
      },
    );
  }
}
