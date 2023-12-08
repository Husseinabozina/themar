import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_view_navbar.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishOrderButtomSheetContainer extends StatelessWidget {
  const FinishOrderButtomSheetContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 436.h,
      width: 1.sw,
      padding: EdgeInsets.only(top: 17.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(children: [
        SizedBox(
          width: 247.56.w,
          height: 222.67.h,
          child: Image.asset(AppImages.orderGroup),
        ),
        const Space(height: 22),
        Text(
          'شكرا لك لقد تم تنفيذ طلبك بنجاح',
          style: AppTheme.Font20PrimaryBoldStyle(),
        ),
        const Space(height: 16),
        Text(
          'يمكنك متابعة حالة الطلب او الرجوع للرئسيية',
          style: AppTheme.FontColorText2MediumStyle(),
        ),
        const Space(height: 30),
        Row(
          children: [
            Expanded(
              child: BottomNavBottun(
                  color: AppTheme.colorText3,
                  onPressed: () {
                    GoRouter.of(context).push(AppRoutes.homeScreen);
                  },
                  title: Text(
                    'الرئيسية ',
                    style: AppTheme.Font14PrimaryBoldStyle(),
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: BottomNavBottun(
                  color: AppTheme.colorPrimary,
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).onNavigateTohome(1);
                    GoRouter.of(context).push(AppRoutes.homeScreen);
                  },
                  title: Text(
                    'طلباتي ',
                    style: AppTheme.Font14Text3BoldStyle(),
                  )),
            )
          ],
        ),
      ]),
    );
  }
}
