import 'package:flutter/material.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar(
      {super.key,
      required this.items,
      required this.currentIndex,
      required this.onTab});
  List<BottomNavigationBarItem> items;
  int currentIndex = 0;
  void Function(int index) onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        items: items,
        type: BottomNavigationBarType.fixed,
        useLegacyColorScheme: false,
        currentIndex: currentIndex,
        backgroundColor: AppTheme.colorPrimary,
        selectedItemColor: AppTheme.colorText3,
        unselectedItemColor: AppTheme.colorText2,
        unselectedLabelStyle: AppTheme.Font12Text2boldStyle()!
            .copyWith(color: AppTheme.colorButtomNavItem),
        selectedLabelStyle: AppTheme.Font12Text3boldStyle(),
        onTap: (index) => onTab(index),
      ),
    );
  }
}
