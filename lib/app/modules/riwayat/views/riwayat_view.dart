import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:shimmer/shimmer.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../controllers/riwayat_controller.dart';

class RiwayatView extends GetView<RiwayatController> {
  const RiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiwayatController>(
      init: RiwayatController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Riwayat Permintaan'),
            centerTitle: true,
            elevation: 0,
          ),
          body: controller.isLoading
              ? const Material(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                )
              : RefreshIndicator(
                  backgroundColor: Colors.white,
                  color: secondaryColor,
                  onRefresh: () async {
                    controller.fetchAllPermintaan();
                  },
                  child: controller.permintaanModel.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/empty_state.png',
                                height: 130,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Belum ada riwayat permintaan',
                                style: h4SemiBold,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.permintaanModel.length,
                          itemBuilder: (_, index) {
                            var data = controller.permintaanModel[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_PERMINTAAN,
                                    arguments: {
                                      "id": data.id,
                                      "image": data.fotoUrl
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  color: Colors.white,
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
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                      child: Image.network(
                                        data.fotoUrl ?? "",
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return Shimmer.fromColors(
                                              baseColor: const Color.fromARGB(
                                                  255, 148, 148, 148),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      255, 102, 95, 95),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                            child: const Icon(
                                              Icons.image_not_supported,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  255, 53, 53, 53),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    '${data.name}',
                                    style: h6Bold,
                                  ),
                                  subtitle: Text(
                                    data.status!.isEmpty
                                        ? 'Permintaan berhasil dilakukan'
                                        : '${data.status?.last.keterangan}',
                                    style: buttonLinkXSRegular,
                                  ),
                                  trailing: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        data.status!.isEmpty
                                            ? DateFormat(" d MMM ", "id_ID")
                                                .format(data.createdAt!)
                                            : DateFormat(" d MMM ", "id_ID")
                                                .format(data.status!.last
                                                    .tglPerubahan!),
                                        style: buttonLinkXSRegular,
                                      ),
                                      Text(
                                        data.status!.isEmpty
                                            ? DateFormat(" hh:mm", "id_ID")
                                                .format(data.createdAt!)
                                            : DateFormat(" hh:mm", "id_ID")
                                                .format(data.status!.last
                                                    .tglPerubahan!),
                                        style: buttonLinkXSRegular.copyWith(
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
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
