import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/data/order.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_card.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/utils/enums.dart';

class OrderesView extends StatelessWidget {
  const OrderesView({super.key, required this.orderstatus});
  final OrderStatus orderstatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRoutes.deliveryOrderDetailedPage, extra: index);
                },
                child: OrderCard(
                  isLogin: true,
                  order: Order(orderStatus: orderstatus),
                )),
            separatorBuilder: (context, index) => SizedBox(
                  height: 18.h,
                ),
            itemCount: 6)
      ],
    );
  }
}
