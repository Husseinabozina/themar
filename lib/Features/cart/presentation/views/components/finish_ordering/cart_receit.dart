import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/reyal_text.dart';

class CartReceiptCard extends StatelessWidget {
  const CartReceiptCard({super.key, this.isOrdered});
  final bool? isOrdered;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139.h,
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppTheme.colorPrimarylight,
          borderRadius: BorderRadius.circular(10).r),
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
              const ReyalPriceText(
                  price: -40,
                  fontSize: 15,
                  fontweight: AppTheme.FontWeightMedium,
                  fontcolor: AppTheme.colorPrimary),
              Text(
                "سعر التوصيل",
                style: AppTheme.Font15PrimaryMediumStyle(),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ReyalPriceText(
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
            height: 10.h,
          ),
          Divider(
            height: 3.h,
            color: const Color(0xFFE2E2E2),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ReyalPriceText(
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
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
