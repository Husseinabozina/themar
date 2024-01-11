import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:themar_app/Features/home/data/models/category.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/core/config/App_routes.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProductsCubit>().getCategoriesProducts(category.id);
        GoRouter.of(context)
            .push(AppRoutes.categoryDetailedPage, extra: category);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 76.h,
                width: 76.w,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.colorAlmond),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: CachedNetworkImage(imageUrl: category.media ?? '')

                      //  SvgPicture.asset(
                      //   category.image,
                      //   height: 44.18.h,
                      //   width: 44.18.w,
                      // ),
                      ),
                ),
              ),
              Text(
                category.name ?? "",
                style: AppTheme.Font19Text1MediumStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
