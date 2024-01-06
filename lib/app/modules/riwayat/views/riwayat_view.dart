import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

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
          ),
          body: controller.isLoading
              ? const Material(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.fetchAllPermintaan();
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.permintaanModel.length,
                    itemBuilder: (_, index) {
                      var data = controller.permintaanModel[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL_PERMINTAAN, arguments: {
                            "id": data.id,
                            "image": data.fotoUrl
                          });
                        },
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.status!.isEmpty
                                        ? DateFormat(" d MMM ", "id_ID")
                                            .format(data.createdAt!)
                                        : DateFormat(" d MMM ", "id_ID")
                                            .format(data
                                                .status!.last.tglPerubahan!),
                                    style: buttonLinkXSRegular,
                                  ),
                                  Text(
                                    data.status!.isEmpty
                                        ? DateFormat(" hh:mm", "id_ID")
                                            .format(data.createdAt!)
                                        : DateFormat(" hh:mm", "id_ID").format(
                                            data.status!.last.tglPerubahan!),
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
