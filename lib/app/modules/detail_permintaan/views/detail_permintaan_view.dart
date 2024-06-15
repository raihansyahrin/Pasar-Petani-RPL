import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pasar_petani/app/helpers/concurrency_format.dart';
import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timelines/timelines.dart';

import '../controllers/detail_permintaan_controller.dart';

class DetailPermintaanView extends GetView<DetailPermintaanController> {
  const DetailPermintaanView({Key? key}) : super(key: key);
  bool isEdgeIndex(int index) {
    return index == 0 ||
        index == controller.detailPermintaan!.status!.length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPermintaanController>(
      initState: (_) {},
      builder: (_) {
        return controller.isLoading
            ? const Material(
                child: Center(child: CircularProgressIndicator()),
              )
            : DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Detail Permintaan'),
                    centerTitle: true,
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            '${controller.foto}',
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 148, 148, 148),
                                  highlightColor:
                                      const Color.fromARGB(255, 102, 95, 95),
                                  child: Container(
                                    // height: 120,
                                    // width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                // height: 120,
                                // width: double.infinity,
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.vertical(
                                  //   top: Radius.circular(16),
                                  // ),
                                  color: Colors.grey,
                                ),
                                child: const Icon(
                                  Icons.image_not_supported,
                                  size: 100,
                                  color: Color.fromARGB(255, 53, 53, 53),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.detailPermintaan?.name ?? "",
                              style: h3Bold,
                            ),
                            Text(
                              CurrencyFormat.convertToIdr(
                                double.tryParse(
                                  controller.detailPermintaan?.harga ?? "",
                                ),
                                2,
                              ),
                              style: h5Regular,
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        indicatorColor: primaryColor,
                        labelColor: primaryColor,
                        unselectedLabelColor: grey2Color,
                        tabs: const [
                          Tab(text: 'Detail'),
                          Tab(text: 'Status'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                              .detailPermintaan?.description ??
                                          "Tidak ada deskripsi",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Kategori',
                                              style: h6Bold.copyWith(
                                                color: primaryColor,
                                              ),
                                            ),
                                            Text(
                                              controller.detailPermintaan
                                                      ?.kategori ??
                                                  "Tidak ada kategori",
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            right: 16,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jumlah',
                                                style: h6Bold.copyWith(
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(controller.detailPermintaan
                                                      ?.jumlah ??
                                                  "Tidak ada kategori")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Durasi Tahan',
                                              style: h6Bold.copyWith(
                                                color: primaryColor,
                                              ),
                                            ),
                                            Text(
                                              controller.detailPermintaan
                                                      ?.durasiTahan ??
                                                  "Tidak ada kategori",
                                            )
                                          ],
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            right: 30,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Berat',
                                                style: h6Bold.copyWith(
                                                  color: primaryColor,
                                                ),
                                              ),
                                              Text(
                                                  "${controller.detailPermintaan?.berat ?? "Tidak ada kategori"} kg")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: FixedTimeline.tileBuilder(
                                  theme: TimelineThemeData(
                                    nodePosition: 0,
                                    color: const Color(0xff989898),
                                    indicatorTheme: const IndicatorThemeData(
                                      position: 0,
                                      size: 20.0,
                                    ),
                                    connectorTheme: const ConnectorThemeData(
                                      thickness: 2.5,
                                    ),
                                  ),
                                  builder: TimelineTileBuilder.connected(
                                    connectionDirection:
                                        ConnectionDirection.before,
                                    itemCount: controller
                                            .detailPermintaan?.status?.length ??
                                        0,
                                    contentsBuilder: (context, index) {
                                      final status = controller
                                          .detailPermintaan?.status?[index];

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                DateFormat(
                                                        "d MMM yyyy", "id_ID")
                                                    .format(
                                                  status?.tglPerubahan ??
                                                      DateTime.now(),
                                                ),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("${status?.status}"),
                                                  Text("${status?.keterangan}"),
                                                ],
                                              ),
                                              trailing: Text(
                                                DateFormat("h:mm", "id_ID")
                                                    .format(
                                                  status?.tglPerubahan ??
                                                      DateTime.now(),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      );
                                    },
                                    indicatorBuilder: (context, index) {
                                      final isLatest = index == 0;
                                      // Determine indicator based on the index
                                      if (isLatest) {
                                        // Checklist at the first edge for the latest status
                                        return DotIndicator(
                                          color: primaryColor,
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 12.0,
                                          ),
                                        );
                                      } else {
                                        // Outlined indicator for other items
                                        return const OutlinedDotIndicator(
                                          borderWidth: 2.5,
                                        );
                                      }
                                    },
                                    connectorBuilder: (_, index, ___) =>
                                        DashedLineConnector(
                                      // Color for the connector based on whether it's the last item
                                      color: index == 0
                                          ? const Color(0xff66c97f)
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
