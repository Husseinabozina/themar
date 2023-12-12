import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/Profile/presentation/view/utils.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomNamedAppBar(name: 'عن التطبيق'),
            ),
            const Space(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppImages.logo,
                    fit: BoxFit.fill,
                    height: 157.08.h,
                    width: 159.57.w,
                  ),
                ),
              ],
            ),
            const Space(height: 25),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              width: double.infinity,
              child: const Text(
                aboutAppText,
                textDirection: TextDirection.rtl,
              ),
            )
          ],
        ),
      ),
    );
  }
}
