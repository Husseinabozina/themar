import 'package:flutter/material.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/addressPage/address_card.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/banner_slider_widget.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/categories_listview_section.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/home_page_appBar.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/search/presentation/view/pages/search_screen.dart';
import 'package:themar_app/Features/wallet/presentation/view/components/wallet_balance_section.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ProductsCubit, ProductsState>(
          // buildWhen: (previous, current) {
          //   return current is ProductsSuccess ||
          //       current is ProductsFailure ||
          //       current is ProductsLoading;
          // },
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                HomePageAppBar(
                    showingButtonSheet: showbottomsheet, ctx: context),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showSearchBottomNavigationBar(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SearchTextField(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BannderSliderWidget(),
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
                (state is! CategoriesLoading || state is! CategoriesFailure)
                    ? const CategoriesListViewSection()
                    : const SizedBox(),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Text(
                    'الأصناف',
                    style: AppTheme.Font15Text1ExtraBoldStyle(),
                    textAlign: TextAlign.end,
                  ),
                ),
                Space(height: 20.h),
                ProductCardsGridView(
                  itemCount: 4,
                  aspectRacio: 1 / 1.5,
                  products: context.read<ProductsCubit>().products,
                ),
              ],
            );
          },
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

  void showSearchBottomNavigationBar(
    context,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return SearchScreen();
      },
    ).then((value) {});
  }
}

// return Scaffold(
//   backgroundColor: Colors.black,
//   body: WeSlide(
// panelMinSize: _panelMinSize,
// panelMaxSize: _panelMaxSize,
//     body: Container(
//       color: _colorScheme.background,
//       child: Center(child: Text("This is the body")),
//     ),
//     panel: Container(
//       color: _colorScheme.primary,
//       child: Center(child: Text("This is the panel")),
//     ),
//     panelHeader: Container(
//       height: _panelMinSize,
//       color: _colorScheme.secondary,
//       child: Center(child: Text("Slide to Up")),
//     ),
//   ),
// );
