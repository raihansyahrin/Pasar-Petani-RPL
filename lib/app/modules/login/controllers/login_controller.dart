import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/services/authentication_service.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';

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
    Get.defaultDialog(
        title: 'Tunggu sebentar yaa',
        content: const Center(
          child: CircularProgressIndicator(),
        ));
    if (formKey.currentState!.validate()) {
      if (await AuthenticationService().login(
          email: emailController.text, password: passwordController.text)) {
        Get.back();
        Get.snackbar(
          "Success",
          "Berhasil Masuk",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
      } else {
        Get.back();

        Get.snackbar(
          "Gagal",
          "Email dan Password salah",
          backgroundColor: error,
          colorText: Colors.white,
        );
      }
    }
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }
}
