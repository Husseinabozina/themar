import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:themar_app/Features/home/data/models/category_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/category_detailed/category_Item.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/home/home_page_appBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

List<String> labelsList = [
  AppImages.almond,
  AppImages.spices,
  AppImages.dates,
  AppImages.fruit,
  AppImages.steak,
  AppImages.vegetable,
];
List<Color> ColorsList = [
  AppTheme.colorVegetableCateg,
  AppTheme.colorFruitCateg,
  AppTheme.colorSteakCateg,
  AppTheme.colorSpicesCateg,
  AppTheme.colorAlmond,
  AppTheme.colorDates
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 45),
          child: Column(
            children: [
              const HomePageAppBar(),
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
                  decoration: BoxDecoration(
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
              SizedBox(
                height: 110.h,
                child: ListView(
                  padding: EdgeInsets.only(right: 20),
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(
                        category: CategoryModel(
                            label: 'الخضار',
                            color: AppTheme.colorVegetableCateg,
                            image: AppImages.vegetable)),
                    CategoryItem(
                        category: CategoryModel(
                            label: 'الفاكهة',
                            color: AppTheme.colorFruitCateg,
                            image: AppImages.fruit)),
                    CategoryItem(
                        category: CategoryModel(
                            label: 'اللحوم',
                            color: AppTheme.colorSteakCateg,
                            image: AppImages.steak)),
                    CategoryItem(
                        category: CategoryModel(
                            label: 'البهارات',
                            color: AppTheme.colorSpicesCateg,
                            image: AppImages.spices)),
                    CategoryItem(
                        category: CategoryModel(
                            label: 'التمور',
                            color: AppTheme.colorAlmond,
                            image: AppImages.almond)),
                    CategoryItem(
                        category: CategoryModel(
                            label: 'المكسرات',
                            color: AppTheme.colorDates,
                            image: AppImages.dates)),
                  ],
                ),
              ),
              const Text('الأصناف'),
              ProductsGridView(
                itemCount: 4,
                aspectRacio: 1 / 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
