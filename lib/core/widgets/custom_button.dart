import 'package:flutter/material.dart';
import 'package:themar_app/Features/auth/views/utils/auth_modes.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:go_router/go_router.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.authMode});
  final AuthMode authMode;
  Widget chekAuthMode(AuthMode authMode) {
    if (authMode == AuthMode.signIn) {
      return Text(
        'تسجيل الدخول',
        style: AppTheme.Font15Text3BoldStyle(),
      );
    } else if (authMode == AuthMode.signUp) {
      return Text(
        'التسجيل',
        style: AppTheme.Font15Text3BoldStyle(),
      );
    } else {
      return Text(
        'تأكيد رقم الجوال',
        style: AppTheme.Font15Text3BoldStyle(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppTheme.colorPrimary,
              borderRadius: BorderRadius.circular(10)),
          child: TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.homePage);
              },
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: chekAuthMode(authMode)))),
    );
  }
}
