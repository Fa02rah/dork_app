import 'package:flutter/material.dart';
// التعديل: المسار الصحيح لملف الألوان بناءً على مجلداتك هو core/resources وليس core/constants
import '../../../../core/constants/color_manager.dart';

class BookingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BookingActionButton({
    super.key,
    required this.onPressed,
    this.text = "تأكيد الحجز الآن",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // التعديل الجمالي: إضافة Container مع BoxDecoration لعمل ظل (Shadow) متوهج برتقالي
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorManager.accent.withOpacity(0.3), // ظل برتقالي ناعم
            blurRadius: 15,
            offset: const Offset(0, 8), // دفع الظل للأسفل لإعطاء عمق
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.accent, // اللون البرتقالي المعتمد
          foregroundColor: ColorManager.white,
          minimumSize: const Size(double.infinity, 58), // حجم الزر
          elevation: 0, // جعلنا الارتفاع 0 لأننا نتحكم بالظل يدوياً في الـ Container
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Cairo', // الخط المعتمد في مشروعك
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}