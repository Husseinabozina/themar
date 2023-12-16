import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/about_app_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personal_info_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/common_question_section.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/profilePage/profile_header.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/login/login_cubit.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const Space(height: 20),
            const PersonalInfoSection(),
            const Space(height: 20),

            const QuestionSection(),
            // section three //////
            const Space(height: 20),

            const AboutAppSection(),
            const Space(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 13),
                width: double.infinity,
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
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(AppImages.signOut)),
                    InkWell(
                      onTap: () {
                        BlocProvider.of<LoginCubit>(context).signOUt(context);
                      },
                      child: Text(
                        'تسجيل الخروج',
                        style: AppTheme.Font13PrimaryBoldStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
