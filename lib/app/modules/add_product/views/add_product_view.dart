import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

import '../../../shared/theme/color.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Kirim Permintaan'),
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
                Text(
                  'Foto Produk',
                  style: h5Bold,
                ),
              controller.file == null
                  ? EmptyImage(onTap: controller.getImage)
                  : FillImage(
                      onTap: controller.getImage,
                      file: controller.file,
                    ),
                const SizedBox(
                  height: 8,
                ),
                FormTile(
                  title: "Nama Produk",
                  controller: controller.name,
                  keyboardType: TextInputType.name,
                ),
                FormTile(
                  title: "Description",
                  controller: controller.description,
                  keyboardType: TextInputType.name,
                ),
                FormTile(
                  title: "Kategori",
                  controller: controller.category,
                  keyboardType: TextInputType.name,
                ),
                FormTile(
                  title: "Harga",
                  controller: controller.price,
                  keyboardType: TextInputType.number,
                ),
                FormTile(
                  title: "Jumlah",
                  controller: controller.jumlah,
                  keyboardType: TextInputType.number,
                ),
                FormTile(
                  title: "Durasi Tahan",
                  controller: controller.duration,
                ),
                FormTile(
                  title: "Berat",
                  controller: controller.weight,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: controller.product,
            child: const Text(
              'Kirim',
            ),
          ),
        ),
      );
    });
  }
}

class EmptyImage extends StatelessWidget {
  final void Function()? onTap;
  final XFile? file;
  const EmptyImage({
    super.key,
    required this.onTap,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 78,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: whiteColor,
        ),
        child: Center(
          child: Image.asset(
            'assets/img/camera.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}

class FillImage extends StatelessWidget {
  final void Function()? onTap;
  final XFile? file;
  const FillImage({
    super.key,
    required this.onTap,
    this.file,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 78,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: whiteColor,
        ),
        child: Center(
          child: Image.file(
            File(file!.path),
            fit: BoxFit.fitHeight,
            width: 78,
            height: 72,
          ),
        ),
      ),
    );
  }
}

class FormTile extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const FormTile({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: h5Bold,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          maxLines: null,
        ),
        const Divider(),
      ],
    );
  }
}
