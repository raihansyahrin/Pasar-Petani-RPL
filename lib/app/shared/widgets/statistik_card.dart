
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(
        16,
      ),
      margin: EdgeInsets.only(
        left: marginLeft ?? 0,
        right: marginRight ?? 0,
        top: marginTop ?? 0,
        bottom: marginBottom ?? 0,
      ),
      child: Column(
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
