import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/home/presentation/views/widgets/product_detailed/rating_listile.dart';

class RatingListView extends StatelessWidget {
  const RatingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
              width: 20.w,
            ),
        itemBuilder: (context, index) => const RatingListTile());
  }
}
