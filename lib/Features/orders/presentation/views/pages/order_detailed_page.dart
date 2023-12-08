import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/data/order.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_card.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/utils/enums.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/receit_card.dart';

class OrderDetailedPage extends StatelessWidget {
  const OrderDetailedPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomNamedAppBar(name: 'تفاصيل الطلب'),
            SizedBox(
              height: 21.h,
            ),
            Hero(
                tag: 'orderCard$index',
                child: OrderCard(
                  order: Order(orderStatus: OrderStatus.done),
                )),
            SizedBox(
              height: 21.h,
            ),
            Text(
              'عنوان التوصيل',
              style: AppTheme.Font17PrimaryBoldStyle(),
            ),
            SizedBox(
              height: 19.h,
            ),
            Container(
              height: 85.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                  right: 13.w, left: 13.w, top: 8.h, bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 62.h,
                    width: 72.w,
                    decoration: const BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(AppImages.map))),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'المنزل',
                          style: AppTheme.Font15PrimaryMediumStyle(),
                        ),
                        Text(
                          'data',
                          style: AppTheme.Font12Text2LightStyle(),
                        ),
                        Text(
                          'شارع العليا الرياض 12521 السعودية',
                          style: AppTheme.Font12Text1LightStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
              "ملخص الطلب",
              style: AppTheme.Font17PrimaryBoldStyle(),
            ),
            SizedBox(
              height: 19.h,
            ),
            const ReceiptCard(
              isOrdered: true,
            )
          ],
        ),
      ),
    );
  }
}
