import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/payed_order_section.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/charging_item.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/wallet_balance_section.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomNamedAppBar(name: 'المحفظة'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const SizedBox(
                  height: 33,
                ),
                const WalletBalanceSection(),
                const Space(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoutes.transactionPage);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عرض الكل',
                          style: AppTheme.Font14Text2LightStyle(),
                        ),
                        Text(
                          'سجل المعاملات',
                          style: AppTheme.Font15PrimaryBoldStyle(),
                        )
                      ],
                    ),
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Space(height: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const ChargingItem(),
                  itemCount: 3,
                ),
                const SizedBox(height: 20),
                const PayedOrderItem(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
