import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/modules/product/views/product_view.dart';
import 'package:pasar_petani/app/modules/profile/views/profile_view.dart';
import 'package:pasar_petani/app/modules/riwayat/views/riwayat_view.dart';

import '../../home/views/home_view.dart';

class BottomNavigationBarController extends GetxController {
 List<Widget> pages = [
  const HomeView(),
  const ProductView(),
  const RiwayatView(),
  const ProfileView(),

 ]; 
 int currentIndex = 0;
 void changePage(int index) {
  currentIndex = index;
  update();
 }
}
