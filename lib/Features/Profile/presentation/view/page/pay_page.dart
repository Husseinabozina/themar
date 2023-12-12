import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/cart/presentation/views/components/finish_ordering/paycard_item.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/wallet_balance_section.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/components/custom_textField.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const CustomNamedAppBar(name: 'الدفع'),
              const SizedBox(
                height: 42,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    const PayCardItem(height: 152.16, width: double.infinity),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 22,
                ),
                itemCount: 5,
              ),
              const SizedBox(
                height: 22,
              ),
              DottedBorderButton(
                  onTap: () {
                    showBottomSheet(context);
                  },
                  title: "إضافة بطاقة")
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 330.h,
              width: 1.sw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(35).r,
                          topRight: const Radius.circular(35).r)
                      .r,
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
                child: Column(children: [
                  Text(
                    'data',
                    style: AppTheme.Font15PrimaryBoldStyle(),
                  ),
                  const Space(height: 20),
                  SizedBox(
                      height: 55.h,
                      child: const customTextField(
                        hintText: 'hintText',
                      )),
                  const Space(height: 10),
                  SizedBox(
                      height: 55.h,
                      child: const customTextField(hintText: 'hintText')),
                  const Space(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 55.h,
                              child:
                                  const customTextField(hintText: 'hintText'))),
                      const SizedBox(width: 20),
                      Expanded(
                          child: SizedBox(
                        height: 55.h,
                        child: const customTextField(hintText: 'hintText'),
                      )),
                    ],
                  ),
                  const Space(height: 10),
                  CustomButton(
                      height: 60.h,
                      title: Text(
                        'إضافة بطاقة',
                        style: AppTheme.Font16Text3BoldStyle(),
                      ),
                      onPressed: () {})
                ]),
              ),
            ),
          );
        });
  }
}
