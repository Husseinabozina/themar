import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/presentation/view/components/personalIfomration/camera_tile.dart';

class CarInoCameraSection extends StatelessWidget {
  const CarInoCameraSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.w,
      runSpacing: 25.h,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      children: const [
        CameraTile(
          title: 'الاستماارة',
        ),
        CameraTile(
          title: 'الاستماارة',
        ),
        CameraTile(
          title: 'الاستماارة',
        ),
        CameraTile(
          title: 'الاستماارة',
        ),
        CameraTile(
          title: 'الاستماارة',
        ),
      ],
    );
  }
}
