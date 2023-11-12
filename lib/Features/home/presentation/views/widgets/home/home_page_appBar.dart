import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_icon_button.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 37.h,
            width: 32.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomIconButton(icon: AppImages.bag),
                Positioned(
                    right: 2,
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.colorPrimary,
                      radius: 6.r,
                      child: Text(
                        '3',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'التوصيل الي',
                style: AppTheme.Font12PrimaryBlackStyle(),
              ),
              Text(
                'شارع الملك فهد -جدة',
                style: AppTheme.Font14PrimaryNormalStyle(),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سلة ثمار',
                style: AppTheme.Font14PrimaryBoldStyle(),
              ),
              SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                AppImages.logo,
                height: 20.8,
                width: 20.29,
              ),
            ],
          )
        ],
      ),
    );
  }
}
