import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/data/model/permintaan.dart';
import 'package:pasar_petani/app/services/permintaan.dart';

class ProductController extends GetxController {
  List<PermintaanModel> listProduct = [];
  List<PermintaanModel> filteredList = [];
  bool isLoading = true;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAllPermintaan();
  }

  void fetchAllPermintaan() async {
    listProduct = await PermintaanService().getAllPermintaan();
    filteredList = List.from(listProduct); // Initialize filtered list
    isLoading = false;
    update();
  }

  void filterList(String query) {
    if (query.isEmpty) {
      filteredList = List.from(listProduct); // Reset to full list if query is empty
    } else {
      filteredList = listProduct
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }
}