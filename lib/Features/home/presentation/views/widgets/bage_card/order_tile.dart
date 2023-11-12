import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        height: 94.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 27,
              width: 27,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFF0000).withOpacity(0.1),
              ),
              child: Center(
                child: Image.asset(
                  AppImages.trash,
                  height: 13.94,
                  width: 13.94,
                  fit: BoxFit.fill,
                ),
              ),
            ),
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
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 78,
                  width: 92,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
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
