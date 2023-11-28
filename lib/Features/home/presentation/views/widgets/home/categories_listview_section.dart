import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/data/models/category_model.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/category_detailed/category_Item.dart';
import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListViewSection extends StatelessWidget {
  const CategoriesListViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView(
        padding: EdgeInsets.only(right: 20.w),
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
    );
  }
}
