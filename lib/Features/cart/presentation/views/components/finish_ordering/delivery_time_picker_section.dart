import 'package:flutter/material.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/read_only_field.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliverTimePickerSection extends StatelessWidget {
  const DeliverTimePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تحديد وقت التوصيل',
          style: AppTheme.Font17PrimaryBoldStyle(),
        ),
        SizedBox(
          height: 13.h,
        ),
        const Row(
          children: [
            Expanded(
              child: ReadOnlyTextField(
                title: 'اختر الوقت',
                icon: AppImages.clock,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: ReadOnlyTextField(
                title: "اختر التاريخ",
                icon: AppImages.calender,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
