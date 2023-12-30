import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/core/config/App_routes.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(BuildContext context) => BlocProvider.of(context);
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  bool isPhoneNumberValid = true;
  String? validatePhoneNumber() {
    if (isPhoneNumberValid) {
      return null;
    } else {
      return "Please enter a valid phone number";
    }
  }

  String? validatePassword() {
    if (passwordController.text.isPasswordEasyWithspace()) {
      return null;
    } else {
      return "Password must be 8 characters";
    }
  }

  login(BuildContext context, formkey) {
    if (formkey.currentState!.validate()) {
      emit(LoginSuccess());
      // disposeAndClear();
      GoRouter.of(context).push(AppRoutes.homeScreen);
    } else {
      emit(LoginFailure());
    }
  }

  signOUt(context) {
    GoRouter.of(context).push(AppRoutes.loginPage);
  }

  disposeAndClear() {
    phoneNumberController.clear();
    passwordController.clear();

    emit(LoginInitial());
  }
}
