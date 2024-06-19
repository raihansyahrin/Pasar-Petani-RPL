import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color.dart';
import '../theme/font.dart';

class BottomSheetPendapatan extends StatelessWidget {
  final String? Function(String? validasi)? validasi;
  final void Function()? penarikan;
  final TextEditingController penarikanController;
  const BottomSheetPendapatan({
    super.key,
    required this.validasi,
    required this.penarikan,
    required this.penarikanController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(
          16,
        ),
        height: 237,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: whiteColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Form Tarik Pendapatan',
                style: bodyBold,
              ),
              Text.rich(
                TextSpan(
                  style: textTitle,
                  text: 'Catatan: ',
                  children: [
                    const TextSpan(
                      text: 'Nominal tidak lebih dari ',
                    ),
                    TextSpan(
                      text: 'Pemasukan',
                      style: textTitle.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: validasi,
                controller: penarikanController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan nominal penarikan',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE1E1E1),
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE1E1E1),
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 106,
                      height: 28,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        // onPressed: penarikan,
                        onPressed: () {
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
                          Future.delayed(const Duration(seconds: 3), () {
                            Get.back();
                          });
                        },

                        child: const Text('Tarik'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
