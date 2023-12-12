import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/paycard_item.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_button.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 317.h,
      width: 376.w,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, bottom: 5).r,
        child: Column(children: [
          Text(
            'البطاقات المحفوظة',
            style: AppTheme.Font15PrimaryBoldStyle(),
          ),
          SizedBox(
            height: 25.h,
          ),
          const PayCardListView(),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'إضافة بطاقة دفع',
                style: AppTheme.Font17PrimaryMeduimStyle(),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                    color: AppTheme.colorPrimarylight,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(child: SvgPicture.asset(AppImages.add)),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: CustomButton(
                title: Text(
                  'تأكيد الإختبار',
                  style: AppTheme.Font15Text3BoldStyle(),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ]),
      ),
    );
  }
}
