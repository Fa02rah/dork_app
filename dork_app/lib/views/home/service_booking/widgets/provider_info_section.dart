import 'package:flutter/material.dart';
// استيراد ملف الألوان
import '../../../../core/constants/color_manager.dart';

class ProviderInfoSection extends StatelessWidget {
  final String image;
  final String name;
  final String branch;

  const ProviderInfoSection({
    super.key,
    required this.image,
    required this.name,
    required this.branch
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          // استخدام اللون الأبيض من مدير الألوان
          backgroundColor: ColorManager.white,
          // إضافة ظل خفيف للـ Avatar ليعطي شكلاً أجمل
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.shadow.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                // معالجة الخطأ في حال لم تتوفر الصورة
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.business, size: 40, color: ColorManager.primary),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManager.black, // استخدام اللون الأسود المعتمد
          ),
        ),
        Text(
          branch,
          style: const TextStyle(
            fontFamily: 'Cairo',
            color: ColorManager.grey, // استخدام الرمادي المعتمد
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}