import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 217.h,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppTheme.colorPrimary,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Stack(
        children: [
          Positioned(
              right: -85,
              top: -20,
              child: Container(
                height: 160.h,
                width: 171.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppTheme.colorPrimarylight.withOpacity(0.1),
                          AppTheme.colorPrimarylight.withOpacity(0.050),
                        ]),
                    shape: BoxShape.circle),
              )),
          Positioned(
              right: -85,
              bottom: -50,
              child: Container(
                height: 160.h,
                width: 171.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppTheme.colorPrimarylight.withOpacity(0.1),
                          AppTheme.colorPrimarylight.withOpacity(0.050),
                        ]),
                    shape: BoxShape.circle),
              )),
          Positioned(
              left: 0,
              bottom: -60,
              child: Container(
                height: 160.h,
                width: 171.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppTheme.colorPrimarylight.withOpacity(0.1),
                          AppTheme.colorPrimarylight.withOpacity(0.050),
                        ]),
                    shape: BoxShape.circle),
              )),
          Positioned(
              left: -50,
              top: -30,
              child: Container(
                height: 160.h,
                width: 171.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          AppTheme.colorPrimarylight.withOpacity(0.1),
                          AppTheme.colorPrimarylight.withOpacity(0.050),
                        ]),
                    shape: BoxShape.circle),
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'حسابي',
                    style: AppTheme.Font20Text3BoldStyle(),
                  ),
                  const Space(height: 20),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(AppImages.map)),
                  Text(
                    'محمد علي',
                    style: AppTheme.Font14Text3BoldStyle(),
                  ),
                  const Space(height: 2),
                  Text(
                    '+34345453345',
                    style: AppTheme.Font14Text2NormalStyle()!
                        .copyWith(color: AppTheme.colorPrimarylight),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
