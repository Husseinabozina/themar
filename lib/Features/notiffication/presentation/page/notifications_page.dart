import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          Text(
            'الإشعارات',
            style: AppTheme.Font20PrimaryBoldStyle(),
          ),
          const Space(height: 48),
          ListView.separated(
              itemBuilder: (context, index) => NotificationTile(
                    notifyTypeMessage: 'تم قبول طلبك وجاري تحضيره الأن',
                    bodyMessage:
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى",
                    time: "منذ ساعتان",
                    icon: Center(
                      child: SvgPicture.asset(AppImages.logo),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: 3)
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notifyTypeMessage,
    required this.bodyMessage,
    required this.time,
    required this.icon,
  });
  final String notifyTypeMessage;
  final String bodyMessage;
  final Widget icon;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0x05000000),
              blurRadius: 8.50,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ]),
      width: double.infinity,
      padding: EdgeInsets.only(top: 11.h, left: 11.w, right: 11.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  notifyTypeMessage,
                  style: AppTheme.Font12Text1MediumStyle(),
                ),
                Text(
                  bodyMessage,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppTheme.colorText2,
                  ),
                ),
                Text(
                  time,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          const Space(
            height: 0,
            width: 10,
          ),
          Container(
            height: 35.h,
            width: 35.w,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.colorPrimarylight),
            child: icon,
          )
        ],
      ),
    );
  }
}
