import 'package:flutter/material.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:themar_app/Features/orders/presentation/views/utils/enums.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';

class AnimatedToggleButtom extends StatefulWidget {
  const AnimatedToggleButtom({super.key});

  @override
  State<AnimatedToggleButtom> createState() => AnimatedToggleButtomState();
}

class AnimatedToggleButtomState extends State<AnimatedToggleButtom> {
  OrderType ordersType = OrderType.current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFF3F3F3))),
      padding: const EdgeInsets.all(7),
      width: double.infinity,
      child: Stack(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    ordersType = OrderType.finished;
                  });
                },
                child: Container(
                  height: 43.h,
                  width: 158.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    ordersType = OrderType.current;
                  });
                },
                child: Container(
                  height: 43.h,
                  width: 158.w,
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            curve: Curves.bounceIn,
            left: ordersType == OrderType.finished ? 0 : null,
            right: ordersType == OrderType.finished ? null : 0,
            duration: const Duration(milliseconds: 1000),
            child: Container(
              height: 43.h,
              width: 158.w,
              decoration: BoxDecoration(
                  color: AppTheme.colorPrimary,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                ordersType = OrderType.finished;
                print(
                    'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff$ordersType');
              });
            },
            child: Container(
              height: 43.h,
              width: 158.w,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Center(
                  child: Text(
                    'المنتهية',
                    style: TextStyle(
                        fontSize: 15,
                        color: ordersType == OrderType.finished
                            ? AppTheme.colorText3
                            : AppTheme.colorText2),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    ordersType = OrderType.current;
                    print(
                        'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff$ordersType');
                  });
                },
                child: Container(
                  height: 43.h,
                  width: 158.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      'الحالية',
                      style: TextStyle(
                          fontSize: 15,
                          color: ordersType == OrderType.finished
                              ? AppTheme.colorText2
                              : AppTheme.colorText3),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
