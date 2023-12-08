import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/profilePage/profile_header.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/profile_category.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:go_router/go_router.dart';

class DeliveryProfilePage extends StatelessWidget {
  const DeliveryProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            CategoryItemContainer(
              child: ProfileCategory(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRoutes.deliveryPersonalInformation);
                },
                title: 'البيانات الشخصية',
                imageIcon: AppImages.user,
              ),
            ),
            const Space(height: 20),

            // section three //////

            const DeliveryProfileInfoSection(),
            const Space(height: 20),

            CategoryItemContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
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
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class CategoryItemContainer extends StatelessWidget {
  const CategoryItemContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
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
        child: child,
      ),
    );
  }
}

class DeliveryProfileInfoSection extends StatelessWidget {
  const DeliveryProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8.50,
            offset: Offset(0, 6),
            spreadRadius: 0,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(15).r),
        child: Column(children: [
          ProfileCategory(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.aboutAppPage);
            },
            title: "عن التطبيق",
            imageIcon: AppImages.info,
          ),
          const Divider(
            thickness: 0.1,
          ),
          ProfileCategory(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.commonQuestionPage);
            },
            title: 'أسئلة متكررة',
            imageIcon: AppImages.question,
          ),
          const Divider(
            thickness: 0.1,
          ),
          const ProfileCategory(
            title: "سياسة الخصوصية",
            imageIcon: AppImages.check,
          ),
          const Divider(
            thickness: 0.2,
          ),
          ProfileCategory(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.contactUsPage);
            },
            title: "تواصل معنا ",
            imageIcon: AppImages.calling,
          ),
          const Divider(
            thickness: 0.2,
          ),
          ProfileCategory(
            title: 'الشكاوي والأقتراحات',
            onTap: () {
              GoRouter.of(context).push(AppRoutes.suggestionPage);
            },
            imageIcon: AppImages.edit,
          ),
        ]),
      ),
    );
  }
}
