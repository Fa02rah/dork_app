import 'package:flutter/material.dart';
import '../constants/color_manager.dart'; // تأكدي أن هذا المسار يوصل لملف الألوان من مكان الملف الجديد

class CustomSettingsTile extends StatelessWidget {
  final IconData icon;       // الأيقونة البرتقالية اليمنى
  final String title;        // نص الخيار
  final VoidCallback onTap;  // الأكشن عند الضغط

  // 🌟 تم تصحيح القوس هنا واستخدام thîs المعرفة في دورت بشكل صحيح
  const CustomSettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: [
              // 1. أيقونة الخيار البرتقالية
              Icon(
                icon,
                color: ColorManager.accent,
                size: 20,
              ),
              const SizedBox(width: 12),

              // 2. عنوان الخيار
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),

              const Spacer(), // دفع السهم الرمادي إلى أقصى اليسار

              // 3. أيقونة السهم الخلفي الرمادي
              const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black26,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}