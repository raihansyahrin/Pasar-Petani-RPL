import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared/theme/color.dart';
import '../../../shared/theme/font.dart';
import '../controllers/riwayat_pendapatan_uang_controller.dart';

class RiwayatPendapatanUangView
    extends GetView<RiwayatPendapatanUangController> {
  const RiwayatPendapatanUangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiwayatPendapatanUangController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Riwayat Pendapatan Uang'),
            centerTitle: true,
          ),
          body: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: primaryShade2,
                ))
              : controller.historyPendapatanUang.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/img/ic_money.svg',
                            height: 170,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            ('Belum Ada Riwayat Penarikan Uang'),
                            style: h4Medium.copyWith(color: primaryColor),
                          )
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        controller.fetchAllHistorySaldo();
                      },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: controller.historyPendapatanUang.length,
                        itemBuilder: (_, index) {
                          var data = controller.historyPendapatanUang[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: ListTile(
                                  leading: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: data.jenis! == "penarikan"
                                          ? primaryShade1
                                          : secondaryColor,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/img/empty-wallet-add.png',
                                        color: data.jenis! == "penarikan"
                                            ? secondaryColor
                                            : accentColor,
                                        width: 24,
                                        height: 24,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    data.jenis! == "penarikan"
                                        ? "Rp.${data.nominal}"
                                        : 'Rp.${data.nominal}',
                                    style: h6Bold,
                                  ),
                                  subtitle: Text(
                                    data.jenis! == "penarikan"
                                        ? 'Pendapatan  Uang Berhasil Ditarik'
                                        : 'Pendapatan Uang Berhasil Masuk',
                                    style: buttonLinkXSRegular,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.waktuPengiriman == null
                                            ? DateFormat(" d MMM ", "id_ID")
                                                .format(data.createdAt!)
                                            : DateFormat(" d MMM ", "id_ID")
                                                .format(data.waktuPengiriman!),
                                        style: buttonLinkXSRegular,
                                      ),
                                      Text(
                                        data.waktuPengiriman == null
                                            ? DateFormat(" hh:mm", "id_ID")
                                                .format(data.createdAt!)
                                            : DateFormat(" hh:mm", "id_ID")
                                                .format(data.waktuPengiriman!),
                                        style: buttonLinkXSRegular.copyWith(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        );
      },
    );
  }
}
