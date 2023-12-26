import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/services/authentication_service.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassword = true;
  final formKey = GlobalKey<FormState>();
  String? emailValidate(String? value) {
    if (!value!.contains("@")) {
      return "Mohon terdapat @ pada email";
    }
    if (value.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    }
    return null;
  }
    String? passwordValidate(String? value) {
    if (value!.length < 7) {
      return "Password diharuskan lebih dari 7 karakter";
    }
    if (value.isEmpty) {
      return "Mohon diisi terlebih dahulu";
    }
    return null;
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      if (await AuthenticationService().login(
          email: emailController.text, password: passwordController.text)) {
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
      }
    }
  }
  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
