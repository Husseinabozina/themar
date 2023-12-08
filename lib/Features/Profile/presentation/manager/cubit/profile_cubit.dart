import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themar_app/core/infrastucture/services/camera_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  File? userImage;
  Future<void> takeImage(ImageSource imageSource) async {
    await CameraService().addImage(imageSource).then((value) {
      userImage = value;
      emit(ChooseImage());
    });
  }

  void clearImage() {
    userImage = null;
    emit(DeleteImage());
  }

  void toggleInfo(int index) {
    if (index == 0) {
      emit(ProfileInitial());
    } else {
      emit(CarInfo());
    }
  }
}
