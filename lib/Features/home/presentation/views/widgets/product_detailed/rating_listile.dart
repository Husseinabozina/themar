import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingListTile extends StatelessWidget {
  const RatingListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 267,
      height: 87,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(AppImages.person))),
          ),
        ),
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 26.h,
                width: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: AppTheme.colorStar,
                    size: 15,
                  ),
                  itemCount: 5,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'محمد علي',
                textDirection: TextDirection.rtl,
                style: AppTheme.Font16PrimaryBoldStyle(),
              )
            ]),
        subtitle: Text(
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم ',
          style: AppTheme.Font12Text1LightStyle(),
        ),
      ),
    );
  }
}
