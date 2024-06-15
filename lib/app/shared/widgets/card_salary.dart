import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/concurrency_format.dart';
import '../../routes/app_pages.dart';
import '../theme/color.dart';
import '../theme/font.dart';

class CardSalary extends StatelessWidget {
  final int? salary;
  final void Function()? onPressed;
  const CardSalary({
    super.key,
    this.salary = 0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Pendapatan',
              style: bodyBold,
            ),
            // subtitle: Text(
            //   salary != null
            //       ? double.parse(salary ?? "0.0") > 0
            //           ? CurrencyFormat.convertToIdr(
            //               double.parse(salary ?? "0.0"), 2)
            //           : "Belum ada"
            //       : "",
            //   style: bodyRegular,
            // ),
            subtitle: Text(
              salary != null
                  ? CurrencyFormat.formatCurrency(salary!)
                  : "Belum ada",
              style: bodyRegular,
            ),
            // subtitle: Text(
            //   salary != null && double.parse(salary!) > 0
            //       ? CurrencyFormat.convertToIdr(double.parse(salary!), 2)
            //       : "Belum ada",
            //   style: bodyRegular,
            // ),

            trailing: GestureDetector(
              onTap: () => Get.toNamed(
                Routes.RIWAYAT_PENDAPATAN_UANG,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Lihat Riwayat\nPendapatan',
                style: body2Regular.copyWith(
                  color: primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: salary == null ? onPressed : null,
              child: Text(
                'Tarik Pendapatan',
                style: buttonLinkLRegular.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
