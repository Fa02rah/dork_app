import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart'; // تأكدي من المسار بحسب مشروعكِ

class BookingHeader extends StatelessWidget {
  final String title; // جعل العنوان ديناميكي لإعادة استخدام الويدجت بسهولة

  const BookingHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر العودة للخلف (متناسق مع اتجاه اللغة)
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_forward_ios, color: ColorManager.primary, size: 22),
          ),

          // عنوان الصفحة المعروض
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87, // يمكنكِ أيضاً استبدالها بـ ColorManager.black إذا أردتِ موثوقية كاملة
            ),
          ),

          const SizedBox(width: 48), // لموازنة السهم والحفاظ على التوسط في الـ Row
        ],
      ),
    );
  }
}