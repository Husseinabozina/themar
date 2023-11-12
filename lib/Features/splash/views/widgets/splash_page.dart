import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/Features/auth/views/screens/login/login_screen.dart';
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
      Duration(seconds: 8),
      () {
        GoRouter.of(context).pushReplacement(AppRoutes.bagCardPage);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 1.sh,
          width: 1.sw,
          child: Stack(children: [
            groupSvg(),

            Positioned(
              right: -140.r,
              bottom: -60.r,
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
            Positioned(
              right: 100.r,
              bottom: 300.r,
              child: Hero(
                tag: 'logo',
                child: SvgPicture.asset(
                  AppImages.logo,
                  fit: BoxFit.fill,
                  height: 188.11.h,
                  width: 172.87.w,
                ),
              ),
            ),
            // Positioned(
            //   right: 180.r,
            //   bottom: 300.r,
            //   child: Transform(
            //       transform: Matrix4.translationValues(0, 0, 0),
            //       alignment: const Alignment(20, 30),

            //       child: SvgPicture.asset(
            //         'assets/Path 2.svg',
            //         width: 86.062.h,
            //         height: 109.468.w,

            //       )
          ])),
    );
  }
}
