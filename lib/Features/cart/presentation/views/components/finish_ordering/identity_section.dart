import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_theme.dart';

class IdentitySection extends StatelessWidget {
  const IdentitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'الإسم : محمد',
          style: AppTheme.Font17PrimaryBoldStyle(),
        ),
        const Space(
          height: 11,
        ),
        Text(
          'الجوال : 05068285914',
          style: AppTheme.Font17PrimaryBoldStyle(),
        ),
      ],
    );
  }
}
