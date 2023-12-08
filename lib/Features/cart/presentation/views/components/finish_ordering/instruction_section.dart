import 'package:flutter/material.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/instraction_textfield.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StructionSection extends StatelessWidget {
  const StructionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 22.h,
        ),
        Text(
          'ملاحظات وتعليمات',
          style: AppTheme.Font17PrimaryBoldStyle(),
        ),
        const InstructionTextField(),
      ],
    );
  }
}
