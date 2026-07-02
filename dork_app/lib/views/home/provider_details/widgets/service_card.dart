import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // ✅ تم التعديل لاستقبال مسار الصورة
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorManager.cardShadowColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorManager.white.withOpacity(0.7),
                border: Border.all(color: ColorManager.white.withOpacity(0.3), width: 1.5),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    // ✅ حاوية الصورة الديناميكية
                    Container(
                      width: 55,
                      height: 55,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorManager.primary.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.business, color: ColorManager.primary),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // ✅ النصوص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700, fontSize: 16, color: ColorManager.textDark)),
                          const SizedBox(height: 10),
                          Text(description, style: const TextStyle(fontFamily: 'Cairo',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}