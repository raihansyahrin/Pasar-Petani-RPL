import 'package:flutter/material.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final String email;
  final String profile;
  final void Function()? onPressed;
  const ProfileWidget({
    super.key,
    required this.name,
    required this.email,
    required this.profile,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
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
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: h5Regular.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                email,
                style: h4Bold.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/img/brush.png',
          width: 24,
          height: 24,
        ),
      ],
    );
  }
}
