import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/Features/auth/data/models/login_request_body.dart';
import 'package:themar_app/Features/auth/data/repos/auth_repo.dart';
import 'package:themar_app/core/Networking/api/api.dart';
import 'package:themar_app/core/Networking/api/api_const.dart';
import 'package:themar_app/core/config/App_routes.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo authRepo;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loginFormKey = GlobalKey<FormState>();
  var userType = "client";
  var type = "android";
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

  login(
    BuildContext context,
  ) async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoading());
      final result = await authRepo.login(loginRequestBody(
          deviceToken: 'test',
          password: passwordController.text,
          phone: phoneNumberController.text,
          type: 'android',
          userType: 'client'));
      result.when(success: (loginresponse) {
        emit(LoginSuccess());
        GoRouter.of(context).push(AppRoutes.homeScreen);
      }, failure: (error) {
        emit(LoginFailure(message: error.apiErrorModel.message));
      });

      // disposeAndClear();
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
