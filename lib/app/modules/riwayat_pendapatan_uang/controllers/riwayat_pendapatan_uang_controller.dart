import 'package:get/get.dart';
import 'package:pasar_petani/app/data/model/history_saldo.dart';
import 'package:pasar_petani/app/services/saldo_service.dart';

class RiwayatPendapatanUangController extends GetxController {
  List<HistorySaldo> historyPendapatanUang = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchAllHistorySaldo();
  }

  Future<void> fetchAllHistorySaldo() async {
    historyPendapatanUang = await SaldoService().getHistorySaldo();
    isLoading = false;
    update();
  }
}
