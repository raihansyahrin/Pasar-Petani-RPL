import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:shimmer/shimmer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) {
        return ColorfulSafeArea(
          color: secondaryShade3,
          child: controller.isLoading
              ? Material(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: secondaryColor,
                    ),
                  ),
                )
              : Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, 130),
                    child: Container(
                      color: secondaryShade3,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'List Produk',
                                style: h3Bold.copyWith(
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: controller.searchController,
                            onChanged: (query) {
                              controller.filterList(query);
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: 'Cari Produk',
                              hintStyle: textPlace.copyWith(
                                color: bottomNavigationBarColor,
                              ),
                              enabled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  borderSide: BorderSide.none),
                              suffixIconConstraints: const BoxConstraints(
                                minWidth: 24,
                                minHeight: 24,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Image.asset(
                                  'assets/img/search-normal.png',
                                  color: bottomNavigationBarColor,
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: RefreshIndicator(
                    backgroundColor: Colors.white,
                    color: secondaryColor,
                    onRefresh: () async {
                      controller.fetchAllPermintaan();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: controller.listProduct.isEmpty
                          ? EmptyState(
                              title: 'Yahh Produk Masih Kosong',
                              subtitle:
                                  'Tambah produk yuk supaya bisa menambah penghasilan',
                              onTap: () {},
                            )
                          : Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 23,
                              ),
                              child: GridView.builder(
                                primary: false,
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.width /
                                          (MediaQuery.of(context).size.height /
                                              1.7),
                                ),
                                itemCount: controller.filteredList.length,
                                itemBuilder: (context, index) {
                                  // var data = controller.filteredList[index];
                                  var data = controller.filteredList.reversed
                                      .toList()[index];

                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.DETAIL_PERMINTAAN,
                                        arguments: {
                                          "id": data.id,
                                          'image': data.fotoUrl,
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16,
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(16),
                                                topLeft: Radius.circular(16),
                                              ),
                                              color: primaryShade1,
                                            ),
                                            width: double.infinity,
                                            child: Center(
                                              child: Image.network(
                                                data.fotoUrl ?? "",
                                                height: 120,
                                                loadingBuilder: (context, child,
                                                    loadingProgress) {
                                                  if (loadingProgress == null) {
                                                    return child;
                                                  } else {
                                                    return Shimmer.fromColors(
                                                      baseColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              148,
                                                              148,
                                                              148),
                                                      highlightColor:
                                                          const Color.fromARGB(
                                                              255, 102, 95, 95),
                                                      child: Container(
                                                        height: 120,
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                            top:
                                                                Radius.circular(
                                                                    16),
                                                          ),
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    height: 120,
                                                    width: double.infinity,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.vertical(
                                                        top:
                                                            Radius.circular(16),
                                                      ),
                                                      color: Colors.grey,
                                                    ),
                                                    child: const Icon(
                                                      Icons.image_not_supported,
                                                      size: 60,
                                                      color: Color.fromARGB(
                                                          255, 53, 53, 53),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${data.name}',
                                                  style: h6Bold,
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  data.status!.isEmpty
                                                      ? 'Permintaan berhasil'
                                                      : data.status?.last
                                                                  .status ==
                                                              "diproses"
                                                          ? "Proses"
                                                          : data.status?.last
                                                                      .status ==
                                                                  "ditolak"
                                                              ? "Ditolak"
                                                              : "Selesai",
                                                  style: h6Regular.copyWith(
                                                    color: data.status!.isEmpty
                                                        ? black
                                                        : data.status?.last
                                                                    .status ==
                                                                "diproses"
                                                            ? doneStatus
                                                            : data.status?.last
                                                                        .status ==
                                                                    "ditolak"
                                                                ? error
                                                                : primaryShade4,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => Get.toNamed(
                                                        Routes
                                                            .DETAIL_PERMINTAAN,
                                                        arguments: {
                                                          "id": data.id,
                                                          "image": data.fotoUrl,
                                                        },
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 6,
                                                          horizontal: 18,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF74DA74),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(3),
                                                        ),
                                                        child: const Text(
                                                          'Detail',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class EmptyState extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const EmptyState({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 60,
        ),
        Image.asset(
          'assets/img/empty_state.png',
          width: 226,
          height: 208,
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            title,
            style: bodyBold,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            subtitle,
            style: body2Regular.copyWith(
              color: bottomNavigationBarColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 42,
          ),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onTap,
            child: const Text('Refresh'),
          ),
        ),
      ],
    );
  }
}
