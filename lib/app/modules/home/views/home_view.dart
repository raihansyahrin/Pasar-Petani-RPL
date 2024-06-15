import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pasar_petani/app/modules/chat-with-ai/views/chat_with_ai_view.dart';
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
          : ColorfulSafeArea(
              color: secondaryShade3,
              child: Scaffold(
                body: RefreshIndicator(
                  backgroundColor: Colors.white,
                  color: secondaryColor,
                  onRefresh: () async {
                    await controller.fetchUser();
                    await controller.fetchSaldo();
                    controller.fetchStatistic();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Stack(
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
                                  salary: controller.saldo?.saldo,
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
                                        data: controller
                                                .statistik?.jumlahDiterima ??
                                            0,
                                        name: 'Produk Diterima',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: StatistikCard(
                                        marginLeft: 8,
                                        data: controller
                                                .statistik?.jumlahProses ??
                                            0,
                                        name: 'Produk Diproses',
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('Konsultasi', style: bodyBold),
                                const SizedBox(
                                  height: 12,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ChatPage(),
                                        ));
                                  },
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: primaryShade15,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(
                                            0,
                                            3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Konsultasi dengan AI',
                                              style: h4Bold,
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2,
                                                horizontal: 10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: secondaryColor2,
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Mulai Konsultasi',
                                                    style: h4Regular,
                                                  ),
                                                  const Icon(Icons
                                                      .arrow_right_alt_rounded)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        LottieBuilder.asset(
                                            'assets/img/chat-ai.json'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
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
