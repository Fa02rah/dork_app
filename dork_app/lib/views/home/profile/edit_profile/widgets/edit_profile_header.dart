import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/color_manager.dart'; // [cite: 2]

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر العودة للخلف
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_forward_ios_rounded, color: ColorManager.primary, size: 22),
          ),

          // عنوان الشاشة
          const Text(
            "تعديل الملف الشخصي",
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManager.black, // [cite: 2]
            ),
          ),

          const SizedBox(width: 48), // لموازنة السهم والحفاظ على التوسط في الـ Row
        ],
      ),
    );
  }
}