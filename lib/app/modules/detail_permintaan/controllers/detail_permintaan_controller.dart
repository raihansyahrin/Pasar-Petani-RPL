import 'package:get/get.dart';
import 'package:pasar_petani/app/data/model/detail_permintaan_model.dart';
import 'package:pasar_petani/app/services/permintaan.dart';

class DetailPermintaanController extends GetxController {
  var id = Get.arguments['id'];
  var foto = Get.arguments['image'];

  bool isLoading = true;
  DetailPermintaanModel? detailPermintaan;
  @override
  void onInit() {
    super.onInit();
    getPermintaan();
  }

  void getPermintaan() async {
    detailPermintaan = await PermintaanService().detailPermintaan(id: id);
    detailPermintaan?.status
        ?.sort((a, b) => b.tglPerubahan!.compareTo(a.tglPerubahan!));
    isLoading = false;
    update();
  }
}
