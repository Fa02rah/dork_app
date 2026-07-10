import 'dart:ui'; // 👈 ضروري لتأثير الضبابية (Glassmorphism)
import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class CategoryItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;
  final double rating;

  const CategoryItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
    required this.rating, // 👈 أضيفيه هنا أيضاً
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        // تأثير الزجاج الخارجي
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
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // تأثير ضبابية الزجاج
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                // لون أبيض بشفافية ليعطي مظهر الزجاج
                color: ColorManager.white.withOpacity(0.7),
                border: Border.all(
                  color: ColorManager.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    // 1. حاوية الصورة
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: ColorManager.primary.withOpacity(0.1), // لون خفيف خلف الأيقونة
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.business, color: ColorManager.primary);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // 2. النصوص
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style:  TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: ColorManager.textDark,
                              shadows: [
                                Shadow(
                                  color: ColorManager.black.withOpacity(0.05), // ظل خفيف جداً
                                  offset: const  Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ]
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded, // أيقونة نجمة واحدة
                                color: ColorManager.accent,
                                size: 20,
                              ),
                              const SizedBox(width: 4), // مسافة صغيرة جداً
                              Text(
                                rating.toString(), // الرقم (مثلاً 4.5)
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: ColorManager.textDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 3. السهم
                    const Icon(
                      Icons.chevron_left_rounded,
                      color: ColorManager.grey,
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