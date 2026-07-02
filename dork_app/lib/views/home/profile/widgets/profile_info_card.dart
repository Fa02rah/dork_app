import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart'; // تأكد من المسار الصحيح لملف الألوان لديك

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // 1. استدعاء اللون الأبيض للخلفية من الـ ColorManager
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // 2. استدعاء اللون الأسود للظل من الـ ColorManager
            color: ColorManager.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary, // اللون الأساسي (الكحلي)
            ),
          ),
          const SizedBox(height: 15),
          ...children,
        ],
      ),
    );
  }
}