import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/addressPage/address_card.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/categories_listview_section.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/home_page_appBar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/wallet_balance_section.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            HomePageAppBar(showingButtonSheet: showbottomsheet, ctx: context),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SearchTextField(),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 164.h,
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.groupHome))),
                child: Center(
                  child: Text(
                    'عروض دائمة',
                    style: AppTheme.Font15Text3BoldStyle(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الكل',
                    style: AppTheme.Font15PrimaryLightStyle(),
                  ),
                  Text(
                    "الأقسام",
                    style: AppTheme.Font15Text1ExtraBoldStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CategoriesListViewSection(),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                'الأصناف',
                style: AppTheme.Font15Text1ExtraBoldStyle(),
                textAlign: TextAlign.end,
              ),
            ),
            Space(height: 20.h),
            const ProductCardsGridView(
              itemCount: 4,
              aspectRacio: 1 / 1.5,
            )
          ],
        ),
      ),
    );
  }

  void showbottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: const EdgeInsets.all(16),
            height: 0.5.sh,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
            child: Column(
              children: [
                Text(
                  'العناوين',
                  style: AppTheme.Font15PrimaryBoldStyle(),
                ),
                const Space(height: 29),
                const AddressCard(),
                const Space(height: 20),
                const AddressCard(),
                const Space(height: 20),
                DottedBorderButton(onTap: () {}, title: 'إضافةعنوان جديد')
              ],
            ),
          );
        });
  }
}
