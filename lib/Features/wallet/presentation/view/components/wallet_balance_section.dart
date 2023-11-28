import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/bagcard_page.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/widgets/reyal_text.dart';

class WalletBalanceSection extends StatelessWidget {
  const WalletBalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 168.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15).r),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'رصيدك',
                  style: AppTheme.Font20PrimaryBoldStyle(),
                ),
                const Space(height: 20),
                const ReyalPriceText(
                    price: 225,
                    fontSize: AppTheme.font24,
                    fontweight: AppTheme.FontWeightBold,
                    fontcolor: AppTheme.colorPrimary),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 33,
        ),
        DottedBorderButton(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.chargingPage);
          },
          title: 'اشحن الأن',
        ),
      ],
    );
  }
}

class DottedBorderButton extends StatelessWidget {
  const DottedBorderButton(
      {super.key, required this.onTap, required this.title});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(15),
        color: AppTheme.colorPrimary,
        dashPattern: [7, 3],
        child: Container(
          height: 54.h,
          decoration: BoxDecoration(
            color:
                //  Color(0xFFF9FCF5),
                const Color(0xFFF9FCF5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTheme.Font15PrimaryBoldStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
