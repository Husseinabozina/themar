import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/utils/enums.dart';

class AnimatedToggleButtom extends StatefulWidget {
  const AnimatedToggleButtom({
    super.key,
    this.onTap,
    required this.leftTitle,
    required this.rightTitle,
  });
  final void Function(int index)? onTap;
  final String leftTitle;
  final String rightTitle;

  @override
  State<AnimatedToggleButtom> createState() => AnimatedToggleButtomState();
}

class AnimatedToggleButtomState extends State<AnimatedToggleButtom> {
  OrderType ordersType = OrderType.current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).r,
          border: Border.all(color: const Color(0xFFF3F3F3))),
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
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
                child: SizedBox(
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
              if (widget.onTap != null) {
                widget.onTap!(1);
              }

              ordersType = OrderType.finished;
            },
            child: Container(
              height: 43.h,
              width: 158.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 75, 66, 66),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Center(
                  child: Text(
                    widget.leftTitle,
                    style: TextStyle(
                        fontSize: 15.sp,
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
                  if (widget.onTap != null) {
                    widget.onTap!(0);
                  }
                  ordersType = OrderType.current;
                },
                child: Container(
                  height: 43.h,
                  width: 158.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      widget.rightTitle,
                      style: TextStyle(
                          fontSize: 15.sp,
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
