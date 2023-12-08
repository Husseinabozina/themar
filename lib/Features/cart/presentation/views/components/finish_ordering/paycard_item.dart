import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayCardListView extends StatelessWidget {
  const PayCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.h,
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(
          width: 12.w,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const PayCardItem(
          height: 107,
          width: 242,
        ),
      ),
    );
  }
}

class PayCardItem extends StatelessWidget {
  const PayCardItem(
      {super.key,
      required this.height,
      required this.width,
      this.cardName,
      this.cardNumber,
      this.validDate});
  final double? height;
  final double? width;
  final String? cardName;
  final int? cardNumber;
  final String? validDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(15)),
      height: height!.h,
      width: width!.w,
      child: Stack(
        children: [
          Positioned(
            top: -20,
            left: -50,
            child: Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.black.withOpacity(0.1)
                      ]),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -20,
            child: Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.black.withOpacity(0.1)
                      ]),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: -40,
            right: -15,
            child: Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.black.withOpacity(0.1)
                      ]),
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            top: -40,
            right: -15,
            child: Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.black.withOpacity(0.1)
                      ]),
                  shape: BoxShape.circle),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 18, top: 17.5, right: 10, bottom: 16).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImages.visa2White),
                    const Text(
                      'Mohamed ali',
                      style: TextStyle(
                          fontSize: AppTheme.font9,
                          fontWeight: AppTheme.FontWeightBold,
                          color: AppTheme.colorText3),
                    ),
                    const Text(
                      '**** **** 4512',
                      style: TextStyle(
                          fontSize: AppTheme.font9,
                          fontWeight: AppTheme.FontWeightBold,
                          color: AppTheme.colorText3),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.check_box,
                      color: Colors.white,
                      size: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          'ValidDate',
                          style: TextStyle(
                              fontSize: 5,
                              fontWeight: AppTheme.FontWeightBold,
                              color: AppTheme.colorText3),
                        ),
                        Text(
                          '06/22',
                          style: TextStyle(
                              fontSize: AppTheme.font9,
                              fontWeight: AppTheme.FontWeightnomral,
                              color: AppTheme.colorText3),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
