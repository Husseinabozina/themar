// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app/Features/Profile/presentation/manager/cubit/profile_cubit.dart';

import 'package:themar_app/core/config/app_assets.dart';
import 'package:themar_app/core/config/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/utils/functions.dart';

class CameraTile extends StatelessWidget {
  const CameraTile({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                state is ChooseImage
                    ? showChoiceDeleteCamera(context)
                    : showChoiceCameraDialog(context);
                // ? showChoiceCameraDialog(context)
                // : showChoiceDeleteCamera(context);
              },
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10).r,
                  color: AppTheme.colorPrimary,
                  dashPattern: const [7, 3],
                  child: SizedBox(
                      height: 75.h,
                      width: 83.w,
                      child: (state is ChooseImage)
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10).r,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: cubit.userImage != null
                                        ? FileImage(cubit.userImage!)
                                            as ImageProvider
                                        : const AssetImage(AppImages.add),
                                  )),
                            )
                          : Center(child: Image.asset(AppImages.camera)))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: AppTheme.Font15PrimaryLightStyle(),
            )
          ],
        );
      },
    );
  }
}
