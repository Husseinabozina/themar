import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory(
      {super.key, required this.title, required this.imageIcon, this.onTap});
  final String title;
  final String imageIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(15).r,
        child: Container(
          height: 18.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                AppImages.arrowGo,
                height: 18.h,
                width: 18.w,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: AppTheme.Font13PrimaryBoldStyle(),
                  ),
                  const Space(
                    width: 7,
                    height: 0,
                  ),
                  SvgPicture.asset(
                    imageIcon,
                    width: 14.w,
                    height: 18.h,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
