import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/modules/home/controllers/home_controller.dart';
import 'package:pasar_petani/app/modules/product/controllers/product_controller.dart';
import 'package:pasar_petani/app/modules/riwayat/controllers/riwayat_controller.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';

import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProfileController());
    ProductController permintaan = Get.put(ProductController());
    Get.put(RiwayatController());

    return GetBuilder<BottomNavigationBarController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: controller.pages.elementAt(
          controller.currentIndex,
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/img/home.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/img/home.png',
                    color: primaryColor,
                    width: 24,
                    height: 24,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/img/produk.png',
                    color: Colors.grey,
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/img/produk.png',
                    color: primaryColor,
                    width: 24,
                    height: 24,
                  ),
                  label: 'Produk',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/img/transaction.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/img/transaction.png',
                    width: 24,
                    height: 24,
                    color: primaryColor,
                  ),
                  label: 'Riwayat',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/img/profile.png',
                    width: 24,
                    height: 24,
                  ),
                  activeIcon: Image.asset(
                    'assets/img/profile.png',
                    width: 24,
                    height: 24,
                    color: primaryColor,
                  ),
                  label: 'Profil',
                ),
              ],
              currentIndex: controller.currentIndex,
              onTap: controller.changePage,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: secondaryShade3,
          child: Center(
            child: Image.asset(
              'assets/img/plus.png',
              width: 24,
              height: 24,
            ),
          ),
          onPressed: () {
            Get.toNamed(Routes.ADD_PRODUCT)
                ?.then((value) => permintaan.fetchAllPermintaan());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
