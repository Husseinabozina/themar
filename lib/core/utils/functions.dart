import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:themar_app/Features/Profile/presentation/manager/cubit/profile_cubit.dart';

void showChoiceCameraDialog(
  BuildContext context,
) {
  final cubit = ProfileCubit.get(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Make a Choice!"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Gallery"),
                  onTap: () async {
                    await cubit.takeImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Camera"),
                  onTap: () async {
                    await cubit.takeImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}

void showChoiceDeleteCamera(
  BuildContext context,
) {
  final cubit = ProfileCubit.get(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Make a Choice!"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Cancel"),
                  onTap: () async {
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: const Text("Delete"),
                  onTap: () async {
                    cubit.clearImage();

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}
