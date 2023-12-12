import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/orders/presentation/views/components/toggleBottom.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/orders_view.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/utils/enums.dart';

class DeliveryOrdersPage extends StatefulWidget {
  const DeliveryOrdersPage({super.key});

  @override
  State<DeliveryOrdersPage> createState() => _DeliveryOrdersPageState();
}

class _DeliveryOrdersPageState extends State<DeliveryOrdersPage> {
  int viewIndex = 0;

  void changeIndex(int index) {
    setState(() {
      viewIndex = index;
    });
  }

  List<Widget> viewlist = [
    const OrderesView(
      orderstatus: OrderStatus.done,
    ),
    const OrderesView(
      orderstatus: OrderStatus.waiting,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Text(
              'طلباتي',
              style: AppTheme.Font20PrimaryBoldStyle(),
            ),
            Space(height: 30.h),
            AnimatedToggleButtom(
              leftTitle: 'المنتهية',
              rightTitle: "الحالية",
              onTap: changeIndex,
            ),
            Space(height: 19.h),
            const SearchTextField(),
            Space(height: 19.h),
            viewlist[viewIndex]
          ],
        ),
      ),
    );
  }
}
