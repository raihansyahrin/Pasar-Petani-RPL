import 'package:get/get.dart';

import '../controllers/riwayat_pendapatan_uang_controller.dart';

class RiwayatPendapatanUangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPendapatanUangController>(
      () => RiwayatPendapatanUangController(),
    );
  }
}
