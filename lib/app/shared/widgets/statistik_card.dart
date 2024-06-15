import 'package:flutter/material.dart';

import '../theme/font.dart';

class StatistikCard extends StatelessWidget {
  final String name;
  final int data;
  final double? marginRight;
  final double? marginLeft;
  final double? marginTop;
  final double? marginBottom;
  const StatistikCard({
    super.key,
    required this.name,
    required this.data,
    this.marginRight,
    this.marginLeft,
    this.marginTop,
    this.marginBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 120,
      width: MediaQuery.sizeOf(context).width / 2 - 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
      padding: const EdgeInsets.all(
        16,
      ),
      // margin: EdgeInsets.only(
      //   left: marginLeft ?? 0,
      //   right: marginRight ?? 0,
      //   top: marginTop ?? 0,
      //   bottom: marginBottom ?? 0,
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$data', style: bodyBold),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: bodyRegular.copyWith(
              color: const Color(
                0xffAAAAAA,
              ),
            ),
          )
        ],
      ),
    );
  }
}
