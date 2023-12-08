import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/delivery_profile_page.dart';
import 'package:themar_app/Features/Profile/presentation/view/page/profile_page.dart';
import 'package:themar_app/Features/home/presentation/views/pages/delivery_home_page.dart';
import 'package:themar_app/Features/home/presentation/views/pages/home_page.dart';
import 'package:themar_app/Features/notification/presentation/page/notifications_page.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/delivery_orders_page.dart';
import 'package:themar_app/Features/orders/presentation/views/pages/orders_page.dart';
import 'package:themar_app/Features/favorite/presentation/view/pages/favourite_page.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> get clientPages => [
        const HomePage(),
        const OrdersPage(),
        const NotificationPage(),
        const FavoritePage(),
        const ProfilePage(),
      ];
  List<Widget> get deliveryPages => [
        const DeliveryProfilePage(),
        const NotificationPage(),
        const DeliveryOrdersPage(),
        const DeliveryHomePage(),
      ];
  int currentIndex = 0;
  List<BottomNavigationBarItem> get deliveryNavItems => [
        BottomNavigationBarItem(
          label: 'حسابي',
          activeIcon: SvgPicture.asset(AppImages.profile,
              color: AppTheme.colorText3, height: 21, width: 21),
          icon: Container(
              child: Center(
                  child: SvgPicture.asset(AppImages.profile,
                      color: AppTheme.colorButtomNavItem,
                      height: 21,
                      width: 21))),
        ),
        BottomNavigationBarItem(
          label: 'الإشعارات',
          icon: SvgPicture.asset(AppImages.notification,
              color: AppTheme.colorButtomNavItem),
          activeIcon: SvgPicture.asset(AppImages.notification,
              color: AppTheme.colorText3),
        ),
        BottomNavigationBarItem(
          label: 'طلباتي',
          icon: SvgPicture.asset(AppImages.orders,
              color: AppTheme.colorButtomNavItem),
          activeIcon:
              SvgPicture.asset(AppImages.orders, color: AppTheme.colorText3),
        ),
        BottomNavigationBarItem(
          label: 'الرئيسية',
          icon: SvgPicture.asset(AppImages.home,
              color: AppTheme.colorButtomNavItem),
          activeIcon:
              SvgPicture.asset(AppImages.home, color: AppTheme.colorText3),
        ),
      ];
  List<BottomNavigationBarItem> get clientNavItems => [
        /// Home

        BottomNavigationBarItem(
          label: 'حسابي',
          activeIcon: SvgPicture.asset(AppImages.profile,
              color: AppTheme.colorText3, height: 21, width: 21),
          icon: Container(
              child: Center(
                  child: SvgPicture.asset(AppImages.profile,
                      color: AppTheme.colorButtomNavItem,
                      height: 21,
                      width: 21))),
        ),
        BottomNavigationBarItem(
          label: 'المفضلة',
          icon: SvgPicture.asset(AppImages.heart,
              color: AppTheme.colorButtomNavItem),
          activeIcon:
              SvgPicture.asset(AppImages.heart, color: AppTheme.colorText3),
        ),

        BottomNavigationBarItem(
          label: 'الإشعارات',
          icon: SvgPicture.asset(AppImages.notification,
              color: AppTheme.colorButtomNavItem),
          activeIcon: SvgPicture.asset(AppImages.notification,
              color: AppTheme.colorText3),
        ),
        BottomNavigationBarItem(
          label: 'طلباتي',
          icon: SvgPicture.asset(AppImages.orders,
              color: AppTheme.colorButtomNavItem),
          activeIcon:
              SvgPicture.asset(AppImages.orders, color: AppTheme.colorText3),
        ),
        BottomNavigationBarItem(
          label: 'الرئيسية',
          icon: SvgPicture.asset(AppImages.home,
              color: AppTheme.colorButtomNavItem),
          activeIcon:
              SvgPicture.asset(AppImages.home, color: AppTheme.colorText3),
        ),
      ];
  Widget getCurrentPage() {
    return deliveryPages[currentIndex];
  }

  void onNavBarTap(int index) {
    currentIndex = index;
    emit(HomePageChanged());
  }

  void onNavigateTohome(index) {
    currentIndex = index;
    emit(HomePageChanged());
  }
}
