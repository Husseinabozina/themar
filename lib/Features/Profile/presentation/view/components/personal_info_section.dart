import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/profile_category.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({
    super.key,
  });

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
              GoRouter.of(context).push(AppRoutes.personalInfoPage);
            },
            title: 'البيانات الشخصية',
            imageIcon: AppImages.user,
          ),
          const Divider(
            thickness: 0.2,
          ),
          ProfileCategory(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.walletPage);
            },
            title: 'المحفظة',
            imageIcon: AppImages.wallet,
          ),
          const Divider(
            thickness: 0.2,
          ),
          ProfileCategory(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.adressPage);
            },
            title: 'العناوين',
            imageIcon: AppImages.location_line,
          ),
          const Divider(
            thickness: 0.2,
          ),
          ProfileCategory(
            title: 'الدفع',
            imageIcon: AppImages.dollar,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.payPage);
            },
          ),
        ]),
      ),
    );
  }
}
