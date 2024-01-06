import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/theme/font.dart';
import '../../add_product/views/add_product_view.dart';
import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
  const ChangeProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeProfileController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Profile'),
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
                controller.file == null
                    ? Center(child: EmptyImage(onTap: controller.getImage))
                    : SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: FillImage(
                            onTap: controller.getImage,
                            file: controller.file,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'name',
                  style: h5Regular.copyWith(
                    color: bottomNavigationBarColor,
                  ),
                ),
                TextFormField(
                  
                  controller: controller.nameTextEditingController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: h5Regular.copyWith(
                    color: bottomNavigationBarColor,
                  ),
                ),
                TextFormField(
                  
                  controller: controller.emailTextEditingController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Alamat',
                  style: h5Regular.copyWith(
                    color: bottomNavigationBarColor,
                  ),
                ),
                TextFormField(
                  
                  controller: controller.alamatTextEditingController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Nomor Telepon',
                  style: h5Regular.copyWith(
                    color: bottomNavigationBarColor,
                  ),
                ),
                TextFormField(
                  
                  controller: controller.nomorHpTextEditingController,
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
            onPressed: controller.changeProfile,
            child: const Text(
              'Simpan',
            ),
          ),
        ),
      );
    });
  }
}
