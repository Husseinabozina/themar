import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/app_theme.dart';

import '../../../../../../core/config/app_assets.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          color: AppTheme.colorPrimarylight,
          borderRadius: BorderRadius.circular(5)),
      child: Center(child: SvgPicture.asset(AppImages.add)),
    );
  }
}
