import 'package:flutter/material.dart';
import '../../../core/constants/color_manager.dart';

class TopRatedCard extends StatelessWidget {
  final String title;
  final String image;
  final double rating;
  final VoidCallback onTap;

  const TopRatedCard({
    super.key,
    required this.title,
    required this.image,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(left: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorManager.accent.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 8),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 45,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.business, size: 40, color: ColorManager.grey),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: ColorManager.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontSize: 12, color: ColorManager.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}