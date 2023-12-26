import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/services/authentication_service.dart';

class RegisterController extends GetxController {
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasiPassword = TextEditingController();
  TextEditingController nomor = TextEditingController();
  final formKey = GlobalKey<FormState>();
  
  void register() async {
    if (formKey.currentState!.validate()) {
      if (await AuthenticationService().registrasi(
          namaLengkap: namaLengkap.text,
          email: email.text,
          alamat: alamat.text,
          password: password.text,
          noHp: nomor.text)) {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }
}
