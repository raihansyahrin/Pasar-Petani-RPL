import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';
import '../../../shared/theme/font.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/img/bottom.png',
            ),
          ),
          SingleChildScrollView(
            reverse: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 72),
                    Text(
                      'Nama Lengkap',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      controller: controller.namaLengkap,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Email',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.email,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Nomor Handphone',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.nomor,
                      decoration: const InputDecoration(),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Alamat Lengkap',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      controller: controller.alamat,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Password',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: controller.password,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Konfirmasi Password',
                      style: h5Regular.copyWith(
                        color: bottomNavigationBarColor,
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: controller.register,
                        child: const Text(
                          'Daftar',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            style: body2Regular,
                            children: [
                              const TextSpan(
                                text: 'Sudah punya akun? ',
                              ),
                              TextSpan(
                                text: 'Masuk',
                                style: body2Bold.copyWith(
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
