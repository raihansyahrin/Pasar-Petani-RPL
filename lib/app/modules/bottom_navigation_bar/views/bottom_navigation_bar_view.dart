import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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
    Get.put(BottomNavigationBarController(), permanent: true);

    return GetBuilder<BottomNavigationBarController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: controller.pages.elementAt(controller.currentIndex),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: controller.currentIndex,
          onTap: controller.changePage,
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
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

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Theme(
        data: ThemeData(
          useMaterial3: false,
        ),
        child: BottomAppBar(
          height: 60,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 3.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => onTap(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/home.png',
                          width: 24,
                          height: 24,
                          color: currentIndex == 0 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Beranda',
                          style: TextStyle(
                            color:
                                currentIndex == 0 ? primaryColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => onTap(1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/produk.png',
                          width: 24,
                          height: 24,
                          color: currentIndex == 1 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Produk',
                          style: TextStyle(
                            color:
                                currentIndex == 1 ? primaryColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 44),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => onTap(2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/transaction.png',
                          width: 24,
                          height: 24,
                          color: currentIndex == 2 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Riwayat',
                          style: TextStyle(
                            color:
                                currentIndex == 2 ? primaryColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => onTap(3),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img/profile.png',
                          width: 24,
                          height: 24,
                          color: currentIndex == 3 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color:
                                currentIndex == 3 ? primaryColor : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pasar_petani/app/modules/home/controllers/home_controller.dart';
// import 'package:pasar_petani/app/modules/product/controllers/product_controller.dart';
// import 'package:pasar_petani/app/modules/riwayat/controllers/riwayat_controller.dart';
// import 'package:pasar_petani/app/shared/theme/color.dart';
// import '../../../routes/app_pages.dart';
// import '../../profile/controllers/profile_controller.dart';
// import '../controllers/bottom_navigation_bar_controller.dart';

// class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
//   const BottomNavigationBarView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     Get.put(ProfileController());
//     ProductController permintaan = Get.put(ProductController());
//     Get.put(RiwayatController());
//     Get.put(BottomNavigationBarController(), permanent: true);

//     return GetBuilder<BottomNavigationBarController>(builder: (_) {
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: controller.pages.elementAt(controller.currentIndex),
//         bottomNavigationBar: Theme(
//           data: Theme.of(context).copyWith(
//             // sets the background color of the BottomNavigationBar
//             canvasColor: Colors.white,
//             // sets the active color of the BottomNavigationBar if Brightness is light
//             primaryColor: Colors.red,
//             textTheme: Theme.of(context).textTheme.copyWith(
//                   bodySmall: const TextStyle(color: Colors.white),
//                 ),
//           ),
//           child: ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/img/home.png',
//                     width: 24,
//                     height: 24,
//                   ),
//                   activeIcon: Image.asset(
//                     'assets/img/home.png',
//                     color: primaryColor,
//                     width: 24,
//                     height: 24,
//                   ),
//                   label: 'Beranda',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/img/produk.png',
//                     color: Colors.grey,
//                     width: 24,
//                     height: 24,
//                   ),
//                   activeIcon: Image.asset(
//                     'assets/img/produk.png',
//                     color: primaryColor,
//                     width: 24,
//                     height: 24,
//                   ),
//                   label: 'Produk',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/img/transaction.png',
//                     width: 24,
//                     height: 24,
//                   ),
//                   activeIcon: Image.asset(
//                     'assets/img/transaction.png',
//                     width: 24,
//                     height: 24,
//                     color: primaryColor,
//                   ),
//                   label: 'Riwayat',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Image.asset(
//                     'assets/img/profile.png',
//                     width: 24,
//                     height: 24,
//                   ),
//                   activeIcon: Image.asset(
//                     'assets/img/profile.png',
//                     width: 24,
//                     height: 24,
//                     color: primaryColor,
//                   ),
//                   label: 'Profil',
//                 ),
//               ],
//               currentIndex: controller.currentIndex,
//               onTap: controller.changePage,
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           shape: const CircleBorder(),
//           backgroundColor: secondaryShade3,
//           child: Center(
//             child: Image.asset(
//               'assets/img/plus.png',
//               width: 24,
//               height: 24,
//             ),
//           ),
//           onPressed: () {
//             Get.toNamed(Routes.ADD_PRODUCT)
//                 ?.then((value) => permintaan.fetchAllPermintaan());
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       );
//     });
//   }
// }
