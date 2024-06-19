import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/services/saldo_service.dart';
import 'package:pasar_petani/app/services/user_service.dart';

import '../../../data/model/saldo.dart';
import '../../../data/model/statistik.dart';
import '../../../data/model/user.dart';
import '../../../services/permintaan.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/theme/font.dart';

class HomeController extends GetxController {
  Users? user;
  Saldo? saldo;
  bool isLoading = false;
  bool isLessThanSaldo = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController penarikanController = TextEditingController();
  StatistikModel? statistik;
  String? validasi(String? value) {
    if (value!.isEmpty) {
      return "Tolong di isi terlebih dahulu";
    } else if (int.parse(value) > int.parse(saldo!.saldo.toString())) {
      return "Uang anda tidak cukup ";
    } else if (int.parse(value) == 0) {
      return "Uang anda kosong mohon menunggu pendapatan anda";
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    fetchSaldo();
    fetchStatistic();
  }
  // @override
  // onInit() async {
  //   await fetchUser();
  //   await fetchSaldo();
  //   fetchStatistic();
  //   super.onInit();
  // }

  Future<void> fetchUser() async {
    isLoading = true;
    update();
    user = await UserService().fetchUser();

    isLoading = false;
    update();
  }

  Future<void> fetchSaldo() async {
    isLoading = true;
    update();
    saldo = await SaldoService().fetchSaldo();
    isLoading = false;
    update();
    // update();
  }

  Future<void> penarikan() async {
    if (await SaldoService().penarikan(
      idUang: saldo!.id ?? 0,
      nominal: penarikanController.text,
    )) {
      fetchSaldo();
      update();
      Get.back();

      Get.defaultDialog(
        title: '',
        titlePadding: const EdgeInsets.only(
          top: 28,
        ),
        content: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/get-money.png',
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Berhasil tarik uang',
                  style: h4Medium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Berhasil tarik dana, estimasi pencarian 2-7 hari, jangan lupa cek rekening nya ya..',
                  style: buttonLinkXSRegular.copyWith(
                    color: bottomNavigationBarColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );

      fetchSaldo();
    }
    update();
  }

  void fetchStatistic() async {
    isLoading = true;
    update();
    statistik = await PermintaanService().getStatistic();
    isLoading = false;
    update();
  }
}
