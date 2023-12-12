import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/data/order.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:themar_app/Features/orders/presentation/views/utils/utiles.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/utils/enums.dart';
import 'package:themar_app/core/components/reyal_text.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({super.key, this.isLogin, required this.order});
  final bool? isLogin;
  final Order order;

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 0.5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, right: 12.w, top: 6.h, bottom: 5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _orderState(orderStatus: widget.order.orderStatus!),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.order.id}#",
                            style: AppTheme.Font17PrimaryBoldStyle(),
                          ),
                          Text(' date of order',
                              style: AppTheme.Font14Text2LightStyle())
                        ],
                      ),
                    ],
                  ),
                ),

                // Customer Identity
                if (widget.isLogin == true)
                  Column(
                    children: [
                      const Divider(
                        height: 2,
                        color: Color(0xFFF3F3F3),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'احمد علاء',
                                  style: AppTheme.Font14PrimaryBoldStyle(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'الرياض',
                                      style: AppTheme.Font14Text2LightStyle(),
                                    ),
                                    const Space(
                                      height: 0,
                                      width: 5,
                                    ),
                                    SvgPicture.asset(AppImages.location_line),
                                  ],
                                )
                              ],
                            ),
                            const Space(
                              width: 10,
                              height: 0,
                            )
                            //personal picture
                            ,
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(AppImages.tomato),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                const Divider(
                  height: 2,
                  color: Color(0xFFF3F3F3),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 21.w, right: 9.w, bottom: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5),
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
            Positioned(
              left: 10.w,
              bottom: 90.h,
              child: Transform.translate(
                offset: _animaiton.value,
                child: const ReyalPriceText(
                  fontSize: 15,
                  fontcolor: AppTheme.colorPrimary,
                  fontweight: AppTheme.FontWeightExtraBold,
                  price: 180,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _orderState({required OrderStatus orderStatus}) {
    return Container(
        decoration: BoxDecoration(
            color: AppTheme.colorPrimarylight,
            borderRadius: BorderRadius.circular(8.r)),
        height: 23.h,
        width: 84.w,
        child: Center(
          child: checkOrderStatus(orderStatus),
        ));
  }
}
