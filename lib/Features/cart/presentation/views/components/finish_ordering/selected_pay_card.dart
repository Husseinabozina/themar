import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedPayCarItem extends StatelessWidget {
  const SelectedPayCarItem({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade400)),
      width: 104.h,
      height: 50.h,
      child: Center(child: widget),
    );
  }
}
