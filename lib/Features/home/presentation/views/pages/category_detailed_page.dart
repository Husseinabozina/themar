import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/space.dart';
import 'package:themar_app/Features/home/data/models/category.dart';
import 'package:themar_app/Features/home/presentation/manager/ProductCubit/cubit/products_cubit.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/category_detailed/filters_icon.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_card.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/search_textField.dart';
import 'package:themar_app/Features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:themar_app/core/components/custom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailedPage extends StatelessWidget {
  const CategoryDetailedPage({required this.category, super.key});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      buildWhen: (previous, current) {
        return current is CategoryProductsSuccess ||
            current is CategoryProductsFailure ||
            current is CategoryProductsLoading;
      },
      builder: (context, state) {
        if (state is CategoryProductsSuccess) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, left: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomNamedAppBar(
                          name: category.name!,
                        ),
                        const Space(height: 20),
                        GestureDetector(
                          onTap: () {
                            showSearchBottomSheet(context);
                          },
                          child: const SearchTextField(
                            icon: FiltersIcon(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Space(height: 20),
                  ProductCardsGridView(
                    itemCount: 8,
                    aspectRacio: 1 / 1.25,
                    products: context.read<ProductsCubit>().categoryProducts,
                  )
                ],
              ),
            ),
          );
        } else if (state is CategoryProductsFailure) {
          return Center(
            child: Text(state.message!),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  showSearchBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {},
          builder: (context, state) {
            var products = context.read<SearchCubit>().categoryProducts.isEmpty
                ? context.read<ProductsCubit>().categoryProducts
                : context.watch<SearchCubit>().categoryProducts;

            return Container(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                children: [
                  SearchTextField(
                    isEnabled: true,
                    onChanged: (value) async {
                      await context
                          .read<SearchCubit>()
                          .searchCategoryProduct(value, category.id);
                      products
                          .where((product) => product.title!
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                      // context.read<SearchCubit>().searchProduct(value);
                    },
                  ),
                  Expanded(
                    child: GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.5 / 2, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return ProductCard(
                              aspectRation: 1.5 / 2, product: products[index]);
                        }),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
