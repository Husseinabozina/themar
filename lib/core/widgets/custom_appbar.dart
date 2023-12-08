import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/widgets/custom_back_button.dart';

class CustomNamedAppBar extends StatelessWidget {
  const CustomNamedAppBar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                name,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                    color: AppTheme.colorPrimary,
                    fontSize: AppTheme.font20,
                    fontWeight: AppTheme.FontWeightBold),
              ),
            ),
            const CustomBackButton(),
          ],
        ),
      ),
    );
  }
}
