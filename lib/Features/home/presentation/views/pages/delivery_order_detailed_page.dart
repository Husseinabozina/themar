import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/data/order.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_card.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/utils/enums.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_button.dart';
import 'package:themar_app/core/widgets/receit_card.dart';

class DeliveryOrderDetailedPage extends StatelessWidget {
  const DeliveryOrderDetailedPage({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                      color: Colors.red,
                      height: 70.h,
                      title: Text(
                        'رفض',
                        style: AppTheme.Font17Text3BoldStyle(),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: CustomButton(
                      height: 70.h,
                      title: Text(
                        'قبول',
                        style: AppTheme.Font17Text3BoldStyle(),
                      ),
                      onPressed: () {
                        _showButtomSheet(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
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
                  isLogin: true,
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
                  Column(
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
            ),
          ],
        ),
      ),
    );
  }

  void _showButtomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => Container(
              padding: EdgeInsets.only(top: 16.h, left: 15.w, right: 15.w),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: 320.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 133.h,
                    width: 133.w,
                    child: SvgPicture.asset(AppImages.confirmation),
                  ),
                  const Space(height: 8),
                  Text(
                    "تم قبولك الطلب بنجاح",
                    style: AppTheme.Font16PrimaryBoldStyle(),
                  ),
                  const Space(height: 11),
                  Text("يمكنك متابعة الطلب لتسليم المنتجات وإنهائه",
                      style: AppTheme.Font16LightBoldStyle()),
                  const Space(height: 21),
                  CustomButton(
                      title: Text(
                        'متابعة الطلب',
                        style: AppTheme.Font16Text3BoldStyle(),
                      ),
                      onPressed: () {})
                ],
              ),
            ));
  }
}
