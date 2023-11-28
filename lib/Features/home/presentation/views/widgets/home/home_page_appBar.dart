import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_icon_button.dart';
import 'package:go_router/go_router.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar(
      {super.key, required this.showingButtonSheet, required this.ctx});
  final void Function(BuildContext context) showingButtonSheet;
  final BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 37.h,
            width: 32.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomIconButton(
                  onTap: () => GoRouter.of(context).push(AppRoutes.bagCardPage),
                  icon: AppImages.bag,
                  color: AppTheme.colorPrimarylight,
                ),
                Positioned(
                    right: 2.w,
                    top: -10.h,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.colorPrimary,
                      radius: 6.r,
                      child: const Text(
                        '3',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showingButtonSheet(ctx);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Column(
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
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سلة ثمار',
                style: AppTheme.Font14PrimaryBoldStyle(),
              ),
              SizedBox(
                width: 5.w,
              ),
              SvgPicture.asset(
                AppImages.logo,
                height: 20.8.h,
                width: 20.29.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
