import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/bage_card/order_tile.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagCardPage extends StatelessWidget {
  const BagCardPage({super.key});

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
                separatorBuilder: (costext, index) => SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => const OrderTile(),
              ),
              SizedBox(
                height: 10.h,
              ),
              CobounTextField(icon:  Padding(
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
                )),),
              SizedBox(
                height: 8.h,
              ),
              Text(
                ' %جميع الأسعار تشمل قيمة الضريبة المضافة 15',
                style: AppTheme.Font15PrimaryMediumStyle(),
              ),
              Container(
                height: 111.h,
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10).r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReyalPriceText(
                            price: 180,
                            fontSize: 15.sp,
                            fontweight: AppTheme.FontWeightMedium,
                            fontcolor: AppTheme.colorPrimary),
                        Text(
                          'إجمالي المنتجات',
                          style: AppTheme.Font15PrimaryMediumStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReyalPriceText(
                            price: -40,
                            fontSize: 15,
                            fontweight: AppTheme.FontWeightMedium,
                            fontcolor: AppTheme.colorPrimary),
                        Text(
                          "الخصم",
                          style: AppTheme.Font15PrimaryMediumStyle(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 3,
                      color: Color(0xFFE2E2E2),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReyalPriceText(
                            price: 140,
                            fontSize: 15,
                            fontweight: AppTheme.FontWeightMedium,
                            fontcolor: AppTheme.colorPrimary),
                        Text(
                          "المجموع",
                          style: AppTheme.Font15PrimaryMediumStyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppTheme.colorPrimary,
                    borderRadius: BorderRadius.circular(15)),
                height: 60.h,
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'الانتقال لإتمام الطلب',
                      style: AppTheme.Font15Text3BoldStyle(),
                    )),
              )
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

class ReyalPriceText extends StatelessWidget {
  const ReyalPriceText(
      {super.key,
      required this.price,
      required this.fontSize,
      required this.fontweight,
      required this.fontcolor});
  final double price;
  final Color fontcolor;
  final double fontSize;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            'ر.س',
            textDirection: TextDirection.rtl,
            style: AppTheme.mainTextStyle(
                color: fontcolor, fontSize: fontSize, fontWeight: fontweight),
            // AppTheme.Font16PrimaryBoldStyle(),
          ),
        ),
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            price.toString(),
            style: AppTheme.Font16PrimaryBoldStyle(),
          ),
        ),
      ],
    );
  }
}
