import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/about_app_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personal_info_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/common_question_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                  )
                ],
              ),
            ),
            const Space(height: 20),
            const PersonalInfoSection(),

            const QuestionSection(),
            // section three //////
            SizedBox(
              height: 20.h,
            ),
            const AboutAppSection(),
            const Space(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                width: 1.sw - (60.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15).r,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x05000000),
                        blurRadius: 8.50,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ],
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(AppImages.signOut)),
                    Text(
                      'تسجيل الخروج',
                      style: AppTheme.Font13PrimaryBoldStyle(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
