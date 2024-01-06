import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/services/user_service.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void changePassword() async {
    Get.defaultDialog(
      title: 'Tunggu Sebentar',
      content: const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (formKey.currentState!.validate()) {
      if (await UserService().changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmPasswordController.text,
      )) {
        Get.back();
        Get.snackbar(
          "Success",
          "Berhasil Merubah Password",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
      } else {
        Get.snackbar(
          "Gagal",
          "Gagal Merubah Password",
          backgroundColor: error,
          colorText: Colors.white,
        );
      }
    }
  }
}
