import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderButton extends StatelessWidget {
  const OrderButton(
      {super.key,
      required this.title,
      required this.height,
      required this.width});
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: DecoratedBox(
          decoration: const BoxDecoration(),
          child: TextButton(
              onPressed: () {},
              child: Text(
                title,
              ))),
    );
  }
}
