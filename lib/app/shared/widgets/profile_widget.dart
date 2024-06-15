import 'package:flutter/material.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:shimmer/shimmer.dart';

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
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 148, 148, 148),
                  highlightColor: const Color.fromARGB(255, 102, 95, 95),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const Icon(
                  Icons.image_not_supported,
                  size: 40,
                  color: Color.fromARGB(255, 53, 53, 53),
                ),
              );
            },
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
                style: h3Bold.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                email,
                style: h5Regular.copyWith(
                  color: Colors.white,
                  // fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Image.asset(
            'assets/img/brush.png',
            width: 24,
            height: 24,
          ),
        ),
      ],
    );
  }
}
