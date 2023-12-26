import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/services/permintaan.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';

class AddProductController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  TextEditingController category = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController weight = TextEditingController();
  XFile? file;
  bool isSendProductSuccess = false;
  void getImage() async {
    file = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void product() async {
    if (await PermintaanService().sendImage(
      imageFile: file,
      name: name.text,
      kategori: category.text,
      berat: int.parse(weight.text),
      harga: int.parse(price.text),
      durasiTahan: duration.text,
      idKoperasi: 19,
      idPetani: 22,
      jumlah: int.parse(jumlah.text),
      description: description.text,
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
