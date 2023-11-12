import 'package:go_router/go_router.dart';
import 'package:themar_app/Features/auth/views/screens/login/login_screen.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/home/presentation/views/bagcard_page.dart';
import 'package:themar_app/Features/home/presentation/views/category_detailed_page.dart';
import 'package:themar_app/Features/home/presentation/views/home_page.dart';
import 'package:themar_app/Features/home/presentation/views/product_detailed_page.dart';
import 'package:themar_app/Features/splash/views/widgets/splash_page.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const categoryDetailedPage = '/categoryDetailedPage';
  static const productDetailedPage = '/productDetailedPage';
  static const loginPage = '/LoginScreen';
  static const bagCardPage = '/bagCardPage';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: loginPage,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: categoryDetailedPage,
      builder: (context, state) =>
          CategoryDetailedPage(name: state.extra! as String),
    ),
    GoRoute(
      path: productDetailedPage,
      builder: (context, state) =>
          ProductDetailedPage(product: state.extra! as ProductModel),
    ),
    GoRoute(
      path: bagCardPage,
      builder: (context, state) => BagCardPage(),
    ),
  ]);
}
