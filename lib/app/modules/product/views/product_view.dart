import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pasar_petani/app/shared/theme/color.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) {
        return SafeArea(
          child: controller.isLoading
              ? const Material(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Scaffold(
                  appBar: PreferredSize(
                    preferredSize: const Size(double.infinity, 150),
                    child: Container(
                      color: secondaryShade3,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
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
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  color: whiteColor,
                                ),
                              )
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
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                  childAspectRatio: 0.75,
                                ),
                                itemCount: controller.filteredList.length,
                                itemBuilder: (context, index) {
                                  var data = controller.filteredList[index];
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
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Get.toNamed(
                                                            Routes
                                                                .DETAIL_PERMINTAAN,
                                                            arguments:{
                                                              "id" : data.id,
                                                              "image" : data.fotoUrl,
                                                            }
                                                          );
                                                        },
                                                        child: const Text(
                                                          'Detail',
                                                        ),
                                                      )
                                                    ],
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
