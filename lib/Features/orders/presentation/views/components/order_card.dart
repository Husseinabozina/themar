import 'package:flutter/material.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/bagcard_page.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/widgets/reyal_text.dart';

class OrderCard extends StatefulWidget {
  OrderCard({
    super.key,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> with TickerProviderStateMixin {
  Widget _orderImage({required String image}) {
    return Container(
      height: 25.h,
      width: 25.w,
      decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image))),
    );
  }

  late Animation _animaiton;
  @override
  void initState() {
    final orderCubit = BlocProvider.of<OrderCubit>(context);

    super.initState();
    orderCubit.controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _animaiton =
        Tween<Offset>(begin: const Offset(10, 75), end: const Offset(10, 40))
            .animate(orderCubit.controller);
    orderCubit.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 0.5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        height: 100.h,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 10, top: 5).r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _orderState(state: 'orderState'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'data',
                            style: AppTheme.Font17PrimaryBoldStyle(),
                          ),
                          Text(' date of order',
                              style: AppTheme.Font14Text2LightStyle())
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                  color: Color(0xFFF3F3F3),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21, right: 9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: AppTheme.colorPrimarylight,
                                borderRadius: BorderRadius.circular(8)),
                            height: 27.h,
                            width: 27.w,
                            child: Center(
                              child: Text(
                                "+2",
                                textAlign: TextAlign.center,
                                style: AppTheme.Font11PrimaryBoldStyle(),
                              ),
                            ),
                          ),
                          _orderImage(image: AppImages.tomato),
                          _orderImage(image: AppImages.tomato),
                          _orderImage(image: AppImages.tomato),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: _animaiton.value,
              child: ReyalPriceText(
                fontSize: 15,
                fontcolor: AppTheme.colorPrimary,
                fontweight: AppTheme.FontWeightExtraBold,
                price: 180,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _orderState({required String state}) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.colorPrimarylight,
            borderRadius: BorderRadius.circular(8.r)),
        height: 23.h,
        width: 84.w,
        child: Center(
          child: Text(state,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: AppTheme.colorPrimary,
                  fontWeight: FontWeight.bold)),
        ));
  }
}
