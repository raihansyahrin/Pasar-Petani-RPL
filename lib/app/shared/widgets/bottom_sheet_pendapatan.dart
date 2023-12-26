import 'package:flutter/material.dart';

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
    return Container(
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
                    onPressed: penarikan,
                    child: const Text('Tarik'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
