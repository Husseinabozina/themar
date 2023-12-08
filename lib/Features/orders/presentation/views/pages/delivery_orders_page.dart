import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/orders/presentation/views/components/toggleBottom.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/orders_view.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryOrdersPage extends StatefulWidget {
  const DeliveryOrdersPage({super.key});

  @override
  State<DeliveryOrdersPage> createState() => _DeliveryOrdersPageState();
}

class _DeliveryOrdersPageState extends State<DeliveryOrdersPage> {
  int viewIndex = 0;

  void changeIndex(int index) {
    print(
        'changingchangingchangingchangingchangingchangingchangingchangingchanging ');
    setState(() {
      viewIndex = index;
    });
  }

  List<Widget> viewlist = [
    const OrderesView(
      text: 'sdfljsdf',
    ),
    const OrderesView(),
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
            const AnimatedToggleButtom(leftTitle: 'المنتهية', rightTitle: "الحالية"),
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
