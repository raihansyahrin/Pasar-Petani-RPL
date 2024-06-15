import 'package:flutter/material.dart';
import 'package:pasar_petani/app/shared/theme/font.dart';
import 'package:shimmer/shimmer.dart';

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
                'Selamat Datang,',
                style: h4Regular.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: h2SemiBold.copyWith(
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
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 148, 148, 148),
                    highlightColor: const Color.fromARGB(255, 102, 95, 95),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        shape: BoxShape.rectangle,
                        color: Colors.grey,
                      ),
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
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
        ),
      ],
    );
  }
}
