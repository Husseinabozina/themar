import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReyalPriceText extends StatelessWidget {
  const ReyalPriceText(
      {super.key,
      required this.price,
      required this.fontSize,
      required this.fontweight,
      required this.fontcolor,
      this.mainAxisAlignment});
  final double price;
  final Color fontcolor;
  final double fontSize;
  final FontWeight fontweight;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            " ر.س",
            textDirection: TextDirection.rtl,
            style: AppTheme.mainTextStyle(
                color: fontcolor, fontSize: fontSize, fontWeight: fontweight),
            // AppTheme.Font16PrimaryBoldStyle(),
          ),
        ),
        FittedBox(
          fit: BoxFit.fill,
          child: Text(
            price.toString(),
            style: AppTheme.mainTextStyle(
                color: fontcolor,
                fontSize: fontSize.sp,
                fontWeight: fontweight),
            // AppTheme.Font16PrimaryBoldStyle(),
          ),
        ),
      ],
    );
  }
}
