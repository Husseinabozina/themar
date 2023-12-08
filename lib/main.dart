import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themar_app/Features/Profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:themar_app/Features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/observer.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
  runApp(const Directionality(
    textDirection: TextDirection.rtl,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Tajwal',
            textTheme: const TextTheme(),
            colorScheme: ColorScheme.fromSeed(
                background: Colors.white, seedColor: AppTheme.colorPrimary),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}
