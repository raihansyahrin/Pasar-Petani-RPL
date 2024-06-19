import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/services/user_service.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';

class ChangeProfileController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();

  XFile? file;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController nomorHpTextEditingController = TextEditingController();
  TextEditingController alamatTextEditingController = TextEditingController();
  void getImage() async {
    file = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void changeProfile() async {
    if (await UserService().changeProfile(
      imageFile: file!,
      name: nameTextEditingController.text,
      email: emailTextEditingController.text,
      noHp: nomorHpTextEditingController.text,
      alamat: alamatTextEditingController.text,
    )) {
      Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
      Get.snackbar(
        "Berhasil menambah",
        "Berhasil menambah permintaan",
        colorText: Colors.white,
        backgroundColor: primaryColor,
      );
    } else {
      Get.snackbar(
        "Maaf terdapat kesalahan",
        "Terdapat kesalahan yang harus diperbaiki",
        colorText: Colors.white,
        backgroundColor: primaryColor,
      );
    }
    update();
  }
}
