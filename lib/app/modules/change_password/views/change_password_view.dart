import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/theme/font.dart';
import '../../bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetBuilder<ChangePasswordController>(builder: (context) {
      return Form(
        key: controller.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Ubah Password'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Password Lama',
                    style: h5Regular.copyWith(
                      color: bottomNavigationBarColor,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.currentPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password Baru',
                    style: h5Regular.copyWith(
                      color: bottomNavigationBarColor,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.newPasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Konfirmasi Password Baru',
                    style: h5Regular.copyWith(
                      color: bottomNavigationBarColor,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: controller.confirmPasswordController,
                  ),
               
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            width: double.infinity,
            height: 48,
            margin: const EdgeInsets.only(
              left: 106,
              right: 105,
              bottom: 44,
            ),
            child: ElevatedButton(
              onPressed: controller.changePassword,
              child: const Text(
                'Simpan',
              ),
            ),
          ),
        ),
      );
    });
  }
}
