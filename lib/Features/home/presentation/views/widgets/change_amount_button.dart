import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/presentation/views/utils/enums.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class changeAmountButton extends StatelessWidget {
  const changeAmountButton({super.key, required this.size});
  final CustomSize size;

  @override
  Widget build(BuildContext context) {
    bool isSizeLarge = size == CustomSize.large;
    return SizedBox(
      height: isSizeLarge ? 35 : 27,
      width: isSizeLarge ? 109 : 72,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppTheme.colorPrimary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(3).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  constraints: const BoxConstraints(),
                  height: isSizeLarge ? 29.h : 23,
                  width: isSizeLarge ? 29.w : 23,
                  padding: EdgeInsets.all(7).w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  child: SvgPicture.asset(
                    AppImages.minus,
                    width: isSizeLarge ? 11.65 : 9.09,
                    height: isSizeLarge ? 1.45 : 1.13,
                  )),
              const SizedBox(
                width: 3,
              ),
              Text(
                '5',
                style: AppTheme.Font15PrimaryMediumStyle(),
              ),
              const SizedBox(
                width: 3,
              ),
              changeButtom(isSizeLarge),
            ],
          ),
        ),
      ),
    );
  }

  Container changeButtom(bool isSizeLarge) {
    return Container(
        // alignment: Alignment(0, 10),
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(7).w,
        height: isSizeLarge ? 29.h : 23,
        width: isSizeLarge ? 29.w : 23,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        child: SvgPicture.asset(
          AppImages.add,
          height: isSizeLarge ? 11.65 : 9.09,
          width: isSizeLarge ? 11.65 : 9.09,
        ));
  }
}
