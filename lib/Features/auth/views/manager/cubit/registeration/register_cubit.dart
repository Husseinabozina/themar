import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

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

  String? validateUsername() {
    if (userNameController.text.isNotEmpty) {
      return null;
    } else {
      return "Please enter a your name";
    }
  }

  String? validatePhoneNumber() {
    if (isPhoneNumberValid) {
      return null;
    } else {
      return "Please enter a valid phone number";
    }
  }

  onAlreadyHaveAnAccountClick(BuildContext context) {
    Navigator.pop(context);
  }

  completePeronalinfo() {
    emit(PeronalInfoComplete());
  }

  backtoPeronaInfo() {
    emit(PeronalInfoback());
  }
}
