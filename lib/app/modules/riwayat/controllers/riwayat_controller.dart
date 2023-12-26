import 'package:get/get.dart';
import 'package:pasar_petani/app/data/model/permintaan.dart';
import 'package:pasar_petani/app/services/permintaan.dart';

class RiwayatController extends GetxController {
  List<PermintaanModel> permintaanModel = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchAllPermintaan();
  }

  Future<void> fetchAllPermintaan()async{
    permintaanModel = await PermintaanService().getAllPermintaan();
    isLoading = false;
    update();
  }
}
