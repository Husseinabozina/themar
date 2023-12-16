import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 4.h, left: 13.w, right: 16.w, bottom: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15).r,
          border: Border.all(color: AppTheme.colorPrimary)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Row(
              children: [
                CustomIconButton(
                    height: 27,
                    width: 27,
                    icon: AppImages.edit_line,
                    color: AppTheme.colorPrimary.withOpacity(0.13)),
                const SizedBox(
                  width: 10,
                ),
                CustomIconButton(
                    height: 27,
                    width: 27,
                    icon: AppImages.trash,
                    color: const Color(0xFFFF0000).withOpacity(0.1))
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'المنزل',
                style: AppTheme.Font15PrimaryBoldStyle(),
              ),
              Text(
                "العنوان : 119 طريق الملك عبدالعزيز",
                style: AppTheme.Font14PrimaryNormalStyle(),
              ),
              Text(
                "الوصف",
                style: AppTheme.Font14Text2LightStyle(),
              ),
              Text(
                "رقم الجوال",
                style: AppTheme.Font14Text2LightStyle(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
