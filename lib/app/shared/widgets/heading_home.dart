import 'package:flutter/material.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

class HeadingHome extends StatelessWidget {
  final String name;
  final String profile;
  final void Function()? onPressed;
  const HeadingHome({
    super.key,
    required this.name,
    required this.profile,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: h5Regular.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: h4Bold.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              80,
            ),
            child: Image.network(
              profile,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
