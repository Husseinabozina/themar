import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/data/order.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_card.dart';
import 'package:themar_app/Features/orders/presentation/views/components/toggleBottom.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/utils/enums.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 50.h),
        child: Column(
          children: [
            Text(
              'طلباتي',
              style: AppTheme.Font20PrimaryBoldStyle(),
            ),
            SizedBox(
              height: 24.h,
            ),
            const AnimatedToggleButtom(
                leftTitle: 'المنتهية', rightTitle: "الحالية")
            // MyToggleButton(),
            ,
            const Space(
              height: 23,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(AppRoutes.orderDetailedPage, extra: index);
                    BlocProvider.of<OrderCubit>(context).controller;
                  },
                  child: Hero(
                      tag: 'orderCard$index',
                      child: OrderCard(
                        order: Order(orderStatus: OrderStatus.gettingPrepared),
                      ))),
              itemCount: 7,
            )
          ],
        ),
      ),
    );
  }
}
