import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class ServiceDescriptionSection extends StatelessWidget {
  final String title;
  final String description;

  const ServiceDescriptionSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15),
        // إضافة ظل خفيف جداً لإعطاء عمق (Depth)
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: ColorManager.primary.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // محاذاة لليمين
        children: [
          const Text(
            "معلومات الخدمة",
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: ColorManager.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              color: ColorManager.accent, // استخدام البرتقالي للعنوان
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'Cairo',
              color: ColorManager.grey,
              fontSize: 14,
              height: 1.6, // زيادة تباعد الأسطر لراحة العين
            ),
          ),
        ],
      ),
    );
  }
}