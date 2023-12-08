import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class changeAmountButton extends StatelessWidget {
  const changeAmountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 109,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppTheme.colorPrimary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(3).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  constraints: const BoxConstraints(),
                  height: 29.h,
                  width: 29.w,
                  padding: const EdgeInsets.all(7).w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  child: SvgPicture.asset(
                    AppImages.minus,
                    width: 11.65,
                    height: 1.45,
                  )),
              Text(
                '5',
                style: AppTheme.Font15PrimaryMediumStyle(),
              ),
              Container(
                  // alignment: Alignment(0, 10),
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(7).w,
                  height: 29.h,
                  width: 29.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: SvgPicture.asset(
                    AppImages.add,
                    height: 11.65,
                    width: 11.65,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
