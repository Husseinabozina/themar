import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/data/models/order.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/delivery_home_page_appbar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/orders/presentation/views/components/order_card.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/utils/enums.dart';

class DeliveryHomePage extends StatelessWidget {
  const DeliveryHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          child: Column(
            children: [
              const DeliveryHomePageAppBar(),
              const Space(height: 20),
              const SearchTextField(),
              const Space(height: 20),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                            AppRoutes.deliveryOrderDetailedPage,
                            extra: index);
                      },
                      child: OrderCard(
                        isLogin: true,
                        order: Order(orderStatus: OrderStatus.waiting),
                      )),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 18,
                      ),
                  itemCount: 6)
            ],
          ),
        ),
      ),
    );
  }
}
