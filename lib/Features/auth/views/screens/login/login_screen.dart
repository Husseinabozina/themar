import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/auth/views/components/auth_form_field.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/phone_number_field.dart';
import 'package:themar_app/Features/auth/views/utils/auth_modes.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _authToggleAnimationController;
  late Animation<double> animation;
  late Animation<double> animation2;
  AuthMode _authMode = AuthMode.signIn;
  double minHeight = 0.h;
  double maxHeight = 76.h;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _authToggleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    animation2 = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_authToggleAnimationController);
    super.initState();
  }

  void changeAuthModes() {
    if (_authMode == AuthMode.signIn) {
      setState(() {
        _authMode = AuthMode.signUp;
      });

      _animationController.forward();
      _authToggleAnimationController.forward();
      if (_authToggleAnimationController.isCompleted) {
        _authToggleAnimationController.reverse();
      } else {
        _authToggleAnimationController.forward();
      }
    } else {
      setState(() {
        _authMode = AuthMode.signIn;
      });

      _animationController.reverse();
      _authToggleAnimationController.reverse();
      if (_authToggleAnimationController.isDismissed) {
        _authToggleAnimationController.forward();
      } else {
        _authToggleAnimationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isNotAuth = _authMode == AuthMode.signUp;
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
                      width: 129.83.w,
                      height: 125.72.h,
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
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: isNotAuth
                            ? Text(
                                'يمكنك تسجيل الدخول اللان',
                                key: const ValueKey("login"),
                                style: AppTheme.Font16Text2LightStyle(),
                              )
                            : Text(
                                'يمكنك تسجيل حساب جديد',
                                key: const ValueKey("singup"),
                                style: AppTheme.Font16Text2LightStyle(),
                              ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                          child: Column(children: [
                        AnimatedContainer(
                          height: _authMode == AuthMode.signUp
                              ? maxHeight
                              : minHeight,
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 1000),
                          constraints: BoxConstraints(
                              maxHeight: maxHeight, minHeight: minHeight),
                          child: SingleChildScrollView(
                            child: FadeTransition(
                              opacity: animation,
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 76),
                                child: Column(
                                  children: [
                                    AuthFormField(
                                      valueKey: 4,
                                      isEnabled: _authMode == AuthMode.signUp,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        AnimatedContainer(
                          height: _authMode == AuthMode.signUp
                              ? maxHeight
                              : minHeight,
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 1000),
                          constraints: BoxConstraints(
                              maxHeight: maxHeight, minHeight: minHeight),
                          child: SingleChildScrollView(
                            child: FadeTransition(
                              opacity: animation,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AuthFormField(
                                    valueKey: 3,
                                    isEnabled: _authMode == AuthMode.signUp,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          height: _authMode == AuthMode.signUp
                              ? maxHeight
                              : minHeight,
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 1000),
                          constraints: BoxConstraints(
                              maxHeight: maxHeight, minHeight: minHeight),
                          child: SingleChildScrollView(
                            child: FadeTransition(
                              opacity: animation,
                              child: AuthFormField(
                                valueKey: 6,
                                isEnabled: _authMode == AuthMode.signUp,
                                label: 'كلمة المرور',
                                icon: SvgPicture.asset(
                                  AppImages.unlock,
                                  height: 25.h,
                                  width: 25.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
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
                    authMode: _authMode,
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  FadeTransition(
                    opacity: animation2,
                    child: InkWell(
                      onTap: () {
                        changeAuthModes();
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
