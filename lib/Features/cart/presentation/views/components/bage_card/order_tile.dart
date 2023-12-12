import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_icon_button.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.only(left: 16.w, right: 6.w, top: 8.h, bottom: 8.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
                icon: AppImages.trash,
                color: const Color(0xFFFF0000).withOpacity(0.1))
            // Container(
            //   height: 27.h,
            //   width: 27.w,
            //   margin: EdgeInsets.only(left: 20.w),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5).r,
            //     color: Color(0xFFFF0000).withOpacity(0.1),
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       AppImages.trash,
            //       height: 13.94.h,
            //       width: 13.94.w,
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            ,
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الطماطم',
                      style: AppTheme.Font15PrimaryBoldStyle(),
                    ),
                    Row(
                      children: [
                        Text(
                          'ر.س',
                          textDirection: TextDirection.rtl,
                          style: AppTheme.Font13PrimaryLightStyle(),
                        ),
                        Text(
                          '45',
                          style: AppTheme.Font13PrimaryBoldStyle(),
                        )
                      ],
                    ),
                    const changeAmountButton(
                      size: CustomSize.small,
                    )
                  ],
                ),
                const Space(height: 20),
                SizedBox(
                  height: 78.h,
                  width: 92.w,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15).r,
                          image: const DecorationImage(
                              image: AssetImage(AppImages.tomato)))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
