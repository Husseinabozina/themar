import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/change_amount_button.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountSection extends StatelessWidget {
  const AmountSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'ر.س',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: AppTheme.colorPrimary,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppTheme.colorPrimary),
            ),
            Text(
              product.priceAfter.toString(),
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                  color: AppTheme.colorPrimary,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppTheme.colorPrimary),
            ),
            SizedBox(
              width: 9.w,
            ),
            // Row(children: [],),
            Text(
              'ر.س',
              textDirection: TextDirection.rtl,
              style: AppTheme.Font16PrimaryBoldStyle(),
            ),
            Text(
              product.priceAfter.toString(),
              style: AppTheme.Font16PrimaryBoldStyle(),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              '40%',
              style: AppTheme.Font13Text2LightStyle(color: Colors.red),
            ),

            Expanded(
              child: Text(
                product.name,
                textAlign: TextAlign.end,
                style: AppTheme.Font22PrimaryBoldStyle(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const changeAmountButton(size: CustomSize.large),
            Expanded(
              child: Text(
                "السعر / 1كجم",
                textAlign: TextAlign.end,
                style: AppTheme.Font19Text2LightStyle(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                product.id!,
                style: AppTheme.Font19Text2LightStyle(),
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                'كود المنتج',
                style: AppTheme.Font17PrimaryBoldStyle(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
