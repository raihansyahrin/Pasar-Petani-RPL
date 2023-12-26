import 'package:get/get.dart';

import '../controllers/detail_permintaan_controller.dart';

class DetailPermintaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPermintaanController>(
      () => DetailPermintaanController(),
    );
  }
}
