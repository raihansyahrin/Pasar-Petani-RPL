import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/data/model/user.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/services/permintaan.dart';
import 'package:pasar_petani/app/services/user_service.dart';
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
  Users? user;
  bool isSendProductSuccess = false;
  bool isLoading = false; // Add this line

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void getImage() async {
    file = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void fetchUser() async {
    user = await UserService().fetchUser();
    update();
  }

  // void product() async {
  //   isLoading = true;
  //   update();
  //   bool isSuccess = await PermintaanService().sendImage(
  //     imageFile: file,
  //     name: name.text,
  //     kategori: category.text,
  //     berat: int.parse(weight.text),
  //     harga: int.parse(price.text),
  //     durasiTahan: duration.text,
  //     idKoperasi: 19,
  //     idPetani: user!.id,
  //     jumlah: int.parse(jumlah.text),
  //     description: description.text,
  //   );
  //   isLoading = false;
  //   if (isSuccess) {
  //     clearInputs();
  //     Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
  //     Get.snackbar(
  //       "Berhasil menambah",
  //       "Berhasil menambah permintaan",
  //       colorText: Colors.white,
  //       backgroundColor: primaryColor,
  //     );
  //   } else {
  //     Get.snackbar(
  //       "Maaf terdapat kesalahan",
  //       "Terdapat kesalahan yang harus diperbaiki",
  //       colorText: Colors.white,
  //       backgroundColor: primaryColor,
  //     );
  //   }
  //   update();
  // }
  void product() async {
    // Perform validation
    if (file == null ||
        name.text.isEmpty ||
        category.text.isEmpty ||
        weight.text.isEmpty ||
        price.text.isEmpty ||
        duration.text.isEmpty ||
        jumlah.text.isEmpty ||
        description.text.isEmpty) {
      Get.snackbar(
        "Input Error",
        "All fields are required",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return;
    }

    // Convert numeric inputs and validate further if necessary
    int? berat = int.tryParse(weight.text);
    int? harga = int.tryParse(price.text);
    int? jumlahValue = int.tryParse(jumlah.text);

    if (berat == null || harga == null || jumlahValue == null) {
      Get.snackbar(
        "Tidak Dapat Mengirim Permintaan",
        "Tolong masukkan permintaan dengan benar.",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return;
    }

    isLoading = true;
    update();

    try {
      bool isSuccess = await PermintaanService().addPermintaan(
        imageFile: file,
        name: name.text,
        kategori: category.text,
        berat: berat,
        harga: harga,
        durasiTahan: duration.text,
        idKoperasi: 73,
        idPetani: user!.id,
        jumlah: jumlahValue,
        description: description.text,
      );

      isLoading = false;

      if (isSuccess) {
        clearInputs();
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
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar(
        "Error",
        "Something went wrong: $e",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }

    update();
  }

  void clearInputs() {
    name.clear();
    description.clear();
    category.clear();
    price.clear();
    jumlah.clear();
    duration.clear();
    weight.clear();
    file = null;
  }
}
