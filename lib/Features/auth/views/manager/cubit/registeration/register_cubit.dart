import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/config/App_routes.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  final registerFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController renterPasswordController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  bool isPhoneNumberValid = false;
  bool isPersonalInfoComplete = false;
  String? validatePassword() {
    if (passwordController.text.isPasswordEasyWithspace()) {
      return null;
    } else {
      return "Password must be 8 characters";
    }
  }

  String? validateRenterPassword() {
    if (renterPasswordController.text == passwordController.text) {
      return null;
    } else if (renterPasswordController.text.isEmpty) {
      return "Password must be 8 characters";
    } else {
      return "the two passowrd does not match";
    }
  }

  String? validateUsername() {
    if (userNameController.text.isNotEmpty) {
      return null;
    } else {
      return "Please enter a your name";
    }
  }

  String? validateCity() {
    if (userNameController.text.isNotEmpty) {
      return null;
    } else {
      return "Please enter a your city";
    }
  }

  onResendClick() {}

  String? validatePhoneNumber() {
    if (isPhoneNumberValid) {
      return null;
    } else {
      return "Please enter a valid phone number";
    }
  }

  register(context) {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterSuccess());
      GoRouter.of(context).push(AppRoutes.activatePinPage);
    } else {
      emit(RegisterFailure());
    }
  }

  String? pinValidator(String? pin) {}

  onAlreadyHaveAnAccountClick(BuildContext context) {
    Navigator.pop(context);
  }

  completePeronalinfo() {
    emit(PeronalInfoComplete());
  }

  backtoPeronaInfo() {
    emit(PeronalInfoback());
  }

  onDoneclick(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.loginPage);
  }
}
