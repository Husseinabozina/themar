import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/reyal_text.dart';

class ReceiptCard extends StatelessWidget {
  const ReceiptCard({super.key, required this.isOrdered});
  final bool isOrdered;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Space(
            height: 10,
          ),
          const Divider(
            height: 3,
            color: Color(0xFFE2E2E2),
          ),
          const Space(
            height: 5,
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
          if (isOrdered)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 17.w, right: 9.w, top: 9.h, bottom: 13.h),
                  decoration: const BoxDecoration(
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
