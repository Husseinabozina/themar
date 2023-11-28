import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/Features/cart/presentation/views/components/bage_card/order_tile.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
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
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 17, right: 17),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const CustomNamedAppBar(name: 'السلة'),
              SizedBox(
                height: 10.h,
              ),
              ListView.separated(
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
                    padding: EdgeInsets.only(right: 10, left: 10),
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
              CustomButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.finsihOrderPage);
                  },
                  title: Text(
                    'الانتقال لإتمام الطلب',
                    style: AppTheme.Font16Text3BoldStyle(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CobounTextField extends StatelessWidget {
  const CobounTextField({super.key, this.icon});
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextField(
          showCursor: false,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            prefixIcon: icon ?? null,
            prefixIconConstraints: BoxConstraints(),
            hintStyle: AppTheme.Font15Text2LightStyle(),
            hintTextDirection: TextDirection.rtl,
            contentPadding: EdgeInsets.only(top: 30),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15).r),
            hintText: "عند كوبون ؟ ادخل رقم الكوبون",
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: TextStyle(color: AppTheme.colorPrimary),

            suffixIconConstraints: const BoxConstraints(),
            // contentPadding: REdgeInsets.all(10).w,

            fillColor: Colors.white,
            filled: true,
          )),
    );
  }
}
