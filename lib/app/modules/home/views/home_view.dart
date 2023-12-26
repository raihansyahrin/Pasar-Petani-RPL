import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:pasar_petani/app/shared/widgets/heading_home.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/widgets/bottom_sheet_pendapatan.dart';
import '../../../shared/widgets/card_salary.dart';
import '../../../shared/widgets/statistik_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: RefreshIndicator(
                  onRefresh: () async {
                    await controller.fetchUser();
                    await controller.fetchSaldo();
                    controller.fetchStatistic();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          color: secondaryShade3,
                          height: 200,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeadingHome(
                                name: '${controller.user?.nama}',
                                profile: '${controller.user?.fotoUrl}',
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              CardSalary(
                                salary: '${controller.saldo?.saldo}',
                                onPressed: () {
                                  bottomSheet();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text('Statistik', style: bodyBold),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: StatistikCard(
                                      data:
                                          controller.statistik?.jumlahDiterima ??
                                              0,
                                      name: 'Produk Diterima',
                                    ),
                                  ),
                                  Expanded(
                                    child: StatistikCard(
                                      marginLeft: 8,
                                       data:
                                          controller.statistik?.jumlahProses ?? 0,
                                      name: 'Produk Diproses',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }

  Future<dynamic> bottomSheet() {
    return Get.bottomSheet(
      BottomSheetPendapatan(
        validasi: controller.validasi,
        penarikanController: controller.penarikanController,
        penarikan: controller.penarikan,
      ),
    );
  }
}
