import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 8),
      () {
        GoRouter.of(context).push(AppRoutes.loginPage);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Stack(children: [
            groupSvg(),
            Positioned(
              right: -140.w,
              bottom: -60.h,
              child: SizedBox(
                height: 298.h,
                width: 448.w,
                child: const DecoratedBox(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/top-view-assortment-vegetables-paper-bag.png',
                            )))),
              ),
            ),
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Hero(
                tag: 'logo',
                child: Center(
                  child: SvgPicture.asset(
                    AppImages.logo,
                    fit: BoxFit.fill,
                    height: 188.11.h,
                    width: 172.87.w,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
