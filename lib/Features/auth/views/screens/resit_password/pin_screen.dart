import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/auth/views/components/group_widget.dart';
import 'package:themar_app/Features/auth/views/components/pin_field.dart';
import 'package:themar_app/const.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:themar_app/core/components/custom_button.dart';
import 'package:go_router/go_router.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  static const maxSeconds = 90;
  int seconds = maxSeconds;
  Duration duration = Duration(minutes: 1, seconds: 30);

  // Duration get getDuration{

  // //  return duration;
  // //   };

  Timer? timer;
  void _startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (duration.inSeconds == 0) {
        setState(() {
          timer?.cancel();
        });
      } else {
        setState(() {
          duration = duration - Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          groupSvg(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40).w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SvgPicture.asset(
                    AppImages.logo,
                    height: 0.1584.sh,
                    width: 0.3461.sw,
                    // width: 129.83.w,
                    // height: 125.72.h,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'نسيت كلمة المرور',
                        textAlign: TextAlign.end,
                        style: AppTheme.Font16PrimaryBoldStyle(),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '''أدخل الكود المكون من 4 أرقام المرسل علي رقم الجوال+9660548745 ''',
                              style: AppTheme.Font16LightText2Style(),
                            ),
                            TextSpan(
                                text: 'تغيير رقم الجوال',
                                style: AppTheme.Font16PrimaryMediumStyle()!
                                    .copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppTheme.colorPrimary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    GoRouter.of(context).pop();
                                  }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        child: Column(
                          children: [
                            PinField(),
                            const Space(
                              height: 40,
                            ),
                            CustomButton(
                              title: Text(
                                ensurePinText,
                                style: AppTheme.Font15Text3BoldStyle(),
                              ),
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRoutes.newPasswordScreen);
                              },
                            ),
                            const Space(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'لم تستلم الكود ؟',
                                  style: AppTheme.Font16Text2LightStyle(),
                                ),
                                const Space(height: 5),
                                Text(
                                  'يمكنك إعادة إرسال الكود بعد',
                                  style: AppTheme.Font16Text2LightStyle(),
                                ),
                                const Space(height: 23),
                                SizedBox(
                                  height: 71.h,
                                  width: 68.w,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CircularProgressIndicator(
                                        backgroundColor: Colors.grey.shade400,
                                        valueColor:
                                            const AlwaysStoppedAnimation(
                                                AppTheme.colorPrimary),
                                        value: duration.inSeconds / maxSeconds,
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        bottom: 10.h,
                                        left: 10.w,
                                        right: 10.w,
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '${duration.inMinutes}:${twoDigits(duration.inSeconds.remainder(60))}',
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  color: AppTheme.colorPrimary),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 140.w,
                                  height: 50.h,
                                  child: CustomButton(
                                    title: Text(
                                      'إعادة الإرسال',
                                      style: AppTheme.Font15PrimaryBoldStyle(),
                                    ),
                                    onPressed: () {},
                                    hasBordered: true,
                                  ),
                                ),
                              ],
                            ),
                            Space(height: 45),
                            InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRoutes.registerScreen);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    loginText,
                                    style: AppTheme.Font18PrimaryBoldStyle(),
                                  ),
                                  Text(
                                    haveAccountText,
                                    style: AppTheme.Font15PrimaryBoldStyle(),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
