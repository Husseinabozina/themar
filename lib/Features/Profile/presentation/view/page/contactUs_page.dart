import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:themar_app/core/components/custom_textField.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CustomNamedAppBar(name: 'تواصل معنا'),
              const SizedBox(
                height: 34,
              ),
              Container(
                height: 198,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.addressMap))),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -50,
                      right: 10,
                      left: 10,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        width: 312.w,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x05000000),
                              blurRadius: 8.50,
                              offset: Offset(0, 6),
                              spreadRadius: 0,
                            )
                          ],
                          color: AppTheme.colorText3,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'شارع الملك فهد , جدة , المملكة العربية السعودية',
                                  style: AppTheme.Font12PrimaryLightStyle(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AppImages.locationMap)
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'شارع الملك فهد , جدة , المملكة العربية السعودية',
                                  style: AppTheme.Font12PrimaryLightStyle(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AppImages.contact_us)
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'شارع الملك فهد , جدة , المملكة العربية السعودية',
                                  style: AppTheme.Font12PrimaryLightStyle(),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AppImages.message)
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Space(height: 70),
              Text(
                'أو يمكنك إرسال رسالة',
                style: AppTheme.Font13PrimaryBoldStyle(),
              ),
              const Space(height: 32),
              Container(
                padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                    color: AppTheme.colorText3,
                    borderRadius: BorderRadius.circular(15).r,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x05000000),
                        blurRadius: 8.50,
                        offset: Offset(0, 6),
                        spreadRadius: 0,
                      )
                    ]),
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 53.h,
                      child: const customTextField(hintText: 'الاسم'),
                    ),
                    const Space(height: 10),
                    SizedBox(
                      height: 53.h,
                      child: const customTextField(hintText: 'الاسم'),
                    ),
                    const Space(height: 10),
                    const customTextField(
                      hintText: ';',
                      maxlines: 3,
                    ),
                    const Space(height: 10),
                    CustomButton(
                        title: Text(
                          'أرسال ',
                          style: AppTheme.Font15Text3BoldStyle(),
                        ),
                        onPressed: () {})
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
