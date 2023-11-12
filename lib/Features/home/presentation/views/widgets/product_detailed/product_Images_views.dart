import 'package:flutter/material.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/product_detailed_page_appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/core/config/app_assets.dart';

class ProductImagesViews extends StatefulWidget {
  const ProductImagesViews({super.key});

  @override
  State<ProductImagesViews> createState() => _ProductImagesViewsState();
}

class _ProductImagesViewsState extends State<ProductImagesViews> {
  final PageController _controller = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 322.h,
          child: PageView(
            clipBehavior: Clip.none,
            controller: _controller,
            children: [
              productImage(),
              productImage(),
              productImage(),
              productImage(),
            ],
          ),
        ),
        Positioned(top: 40, child: const ProductDetailedPageAppBar()),
        Positioned(
            bottom: 15,
            left: 140,
            child: Center(
                child: SmoothPageIndicator(
                    effect: WormEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 8.h,
                        dotWidth: 8.w),
                    controller: _controller,
                    count: 5)))
      ],
    );
  }

  SizedBox productImage() {
    return SizedBox(
      height: 322.h,
      width: double.infinity,
      child: const DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImages.tomato)))),
    );
  }
}
