import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/Suggestions_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/aboutapp_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/address_picker_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/adress_Page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/contactUs_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/pay_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/personal_information_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/profile_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/question_page.dart';
import 'package:themar_app/Features/notiffication/presentation/page/notifications_page.dart';
import 'package:themar_app/Features/wallet/presentation/view/page/charging_page.dart';
import 'package:themar_app/Features/wallet/presentation/view/page/wallet_page.dart';
import 'package:themar_app/Features/auth/views/screens/login/login_screen.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/finish_odering_page.dart';
import 'package:themar_app/Features/home/data/models/product_model.dart';
import 'package:themar_app/Features/cart/presentation/views/pages/bagcard_page.dart';
import 'package:themar_app/Features/home/presentation/views/pages/category_detailed_page.dart';
import 'package:themar_app/Features/home/presentation/views/pages/home_page.dart';
import 'package:themar_app/Features/home/presentation/views/pages/product_detailed_page.dart';
import 'package:themar_app/Features/home/presentation/views/screens/homeScreen.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/order_detailed_page.dart';
import 'package:themar_app/Features/splash/views/widgets/splash_page.dart';

import '../../Features/wallet/presentation/view/page/transication_page.dart';

class AppRoutes {
  static const homePage = '/homePage';
  static const categoryDetailedPage = '/categoryDetailedPage';
  static const productDetailedPage = '/productDetailedPage';
  static const loginPage = '/LoginScreen';
  static const bagCardPage = '/bagCardPage';
  static const homeScreen = '/homeScreen';
  static const orderDetailedPage = '/orderDetailedPage';
  static const finsihOrderPage = '/finsihOrderPage';
  static const profilePage = '/profilePage';
  static const walletPage = '/walletPage';
  static const chargingPage = '/chargingPage';
  static const transactionPage = '/TransactionPage';
  static const personalInfoPage = '/PersonalInforPage';
  static const aboutAppPage = '/AboutAppPage';
  static const commonQuestionPage = '/CommonQuestionPage';
  static const contactUsPage = '/ContactUsPage';
  static const suggestionPage = '/SuggestionPage';
  static const adressPage = '/AdressPage';
  static const addressPickerPage = '/addressPickerPage';
  static const payPage = '/PayPage';
  static const notificationPage = '/NotificationPage';

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
      path: homeScreen,
      builder: (context, state) => HomeScreen(),
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
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: orderDetailedPage,
      builder: (context, state) => OrderDetailedPage(index: state.extra as int),
    ),
    GoRoute(
      path: finsihOrderPage,
      builder: (context, state) => const FinsihOrderPage(),
    ),
    GoRoute(
      path: profilePage,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: walletPage,
      builder: (context, state) => const WalletPage(),
    ),
    GoRoute(
      path: chargingPage,
      builder: (context, state) => const ChargingPage(),
    ),
    GoRoute(
      path: transactionPage,
      builder: (context, state) => const TransactionPage(),
    ),
    GoRoute(
      path: personalInfoPage,
      builder: (context, state) => const PersonalInfoPage(),
    ),
    GoRoute(
      path: aboutAppPage,
      builder: (context, state) => const AboutAppPage(),
    ),
    GoRoute(
      path: commonQuestionPage,
      builder: (context, state) => const CommonQuestionPage(),
    ),
    GoRoute(
      path: contactUsPage,
      builder: (context, state) => const ContactUsPage(),
    ),
    GoRoute(
      path: suggestionPage,
      builder: (context, state) => const SuggestionPage(),
    ),
    GoRoute(
      path: adressPage,
      builder: (context, state) => const AdressPage(),
    ),
    GoRoute(
      path: addressPickerPage,
      builder: (context, state) => const AddressPickerPage(),
    ),
    GoRoute(
      path: payPage,
      builder: (context, state) => const PayPage(),
    ),
    GoRoute(
      path: notificationPage,
      builder: (context, state) => const NotificationPage(),
    ),
  ]);
}
