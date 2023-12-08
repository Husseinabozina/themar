import 'package:flutter/material.dart';
import 'package:themar_app/Features/cart/presentation/views/components/bage_card/copoun_text_field.dart';
import 'package:themar_app/Features/cart/presentation/views/components/bage_card/order_tile.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_button.dart';
import 'package:themar_app/core/widgets/receit_card.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.finsihOrderPage);
            },
            title: Text(
              'الانتقال لإتمام الطلب',
              style: AppTheme.Font15Text3BoldStyle(),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, right: 17),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CustomNamedAppBar(name: 'السلة'),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (costext, index) => const SizedBox(
                      height: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) => const OrderTile(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CobounTextField(
                    icon: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: AppTheme.colorPrimary,
                              borderRadius: BorderRadius.circular(10)),
                          height: 39,
                          width: 79,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'تطبيق',
                              style: AppTheme.Font15Text3BoldStyle(),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    ' %جميع الأسعار تشمل قيمة الضريبة المضافة 15',
                    style: AppTheme.Font15PrimaryMediumStyle(),
                  ),
                  const ReceiptCard(isOrdered: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
