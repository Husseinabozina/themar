import 'package:flutter/material.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/bagcard_page.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/reyal_text.dart';

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({super.key, required this.isOrdered});
  final bool isOrdered;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isOrdered ? 148.h : 111.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
            height: 10.h,
          ),
          Divider(
            height: 3.h,
            color: Color(0xFFE2E2E2),
          ),
          SizedBox(
            height: 5.h,
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
          Divider(
            height: 1,
            color: Colors.grey.shade300,
          ),
          if (isOrdered)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 16.h,
                  width: 51.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(AppImages.visa))),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Text(
                  'تم الدفع بواسطة ',
                  style: AppTheme.Font15PrimaryMediumStyle(),
                )
              ],
            )
        ],
      ),
    );
  }
}
