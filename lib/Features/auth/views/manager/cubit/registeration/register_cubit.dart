import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:go_router/go_router.dart';
import 'package:themar_app/Features/auth/data/models/register_request_body.dart';
import 'package:themar_app/Features/auth/data/repos/auth_repo.dart';
import 'package:themar_app/core/Networking/api/api.dart';
import 'package:themar_app/core/Networking/api/api_const.dart';
import 'package:themar_app/core/Networking/api_service.dart';
import 'package:themar_app/core/Networking/services/location_service.dart';
import 'package:themar_app/core/config/App_routes.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);
  AuthRepo authRepo;

  final registerFormKey = GlobalKey<FormState>();
  int pinCode = 0;
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

  register(context) async {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterLoading());

      var city = await LocationServices().locationByCity(cityController.text);
      var result = await authRepo.register(RegisterRequestBody(
          userName: userNameController.text,
          password: passwordController.text,
          gender: "male",
          phone: phoneNumberController.text,
          lat: city['latitude'],
          lon: city['longitude'],
          passwordConfirmation: passwordController.text));

      result.when(success: (result) {
        emit(RegisterSuccess());
        GoRouter.of(context).push(AppRoutes.activatePinPage);
      }, failure: (error) {
        emit(RegisterFailure(message: error.apiErrorModel.message));
      });
    } else {}
  }

  String? pinValidator(String? pin) {
    if (pinCode.toString() == pin) {
      return null;
    } else {
      return 'pin is incorrect';
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

  onDoneclick(BuildContext context) {
    GoRouter.of(context).push(AppRoutes.loginPage);
  }

  void assignCityController(value) {
    cityController.text = value;
    emit(SelectCity());
  }
}
