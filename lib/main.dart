import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themar_app/Features/Profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/login/login_cubit.dart';
import 'package:themar_app/Features/auth/views/manager/cubit/registeration/register_cubit.dart';
import 'package:themar_app/Features/home/presentation/manager/HomeCubit/home_cubit.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/Features/orders/presentation/manager/cubit/order_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/Networking/services/location_service.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/di/service_locator.dart';
import 'package:themar_app/core/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationSercices().locationByCity();
  setUp();
  Bloc.observer = const AppBlocObserver();
  runApp(const Directionality(
    textDirection: TextDirection.rtl,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<ProductsCubit>()..getCategories(),
        ),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(
          create: (context) => OrderCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
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
