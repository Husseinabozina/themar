import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/charging_item.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/payed_order_section.dart';
import 'package:themar_app/core/widgets/custom_appbar.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomNamedAppBar(
              name: 'سجل المعاملات',
            ),
            const SizedBox(
              height: 40,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => const Space(height: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const ChargingItem(),
              itemCount: 4,
            ),
            const SizedBox(height: 20),
            const PayedOrderItem(),
          ],
        ),
      ),
    );
  }
}
