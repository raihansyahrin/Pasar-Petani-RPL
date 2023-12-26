import 'package:flutter/material.dart';

import '../../helpers/concurrency_format.dart';
import '../theme/color.dart';
import '../theme/font.dart';

class CardSalary extends StatelessWidget {
  final String? salary;
  final void Function()? onPressed;
  const CardSalary({
    super.key,
    this.salary = "",
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'Pendapatan',
              style: bodyBold,
            ),
            subtitle: Text(
                salary != null
                    ? double.parse(salary ?? "0") > 0
                        ? CurrencyFormat.convertToIdr(
                            double.parse(salary ?? "0"), 2)
                        : "Belum ada"
                    : "",
                style: bodyRegular),
            trailing: Text(
              'Lihat Riwayat',
              style: body2Regular.copyWith(
                color: primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 44,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
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
