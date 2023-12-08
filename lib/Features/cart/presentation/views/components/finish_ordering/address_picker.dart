import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/add_button.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdressPickerSection extends StatelessWidget {
  const AdressPickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AddButton(),
            Text(
              "اختر عنوان التوصيل",
              style: AppTheme.Font17PrimaryBoldStyle(),
            ),
          ],
        ),
        const Space(
          height: 18,
        ),
        Container(
          height: 33,
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25).r,
              border: Border.all(color: AppTheme.colorPrimary)),
          width: double.infinity,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(AppImages.arrowDown)),
            Text(
              'المنزل : 119 طريق الملك عبدالعزيز',
              textAlign: TextAlign.center,
              style: AppTheme.Font15PrimaryMediumStyle(),
            )
          ]),
        ),
      ],
    );
  }
}
