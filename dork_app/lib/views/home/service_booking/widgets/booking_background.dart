import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class BookingBackground extends StatelessWidget {
  final Widget child;
  const BookingBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // اللون السماوي الفاتح جداً كما في الصورة
        color: Color(0xFFE3F2FD),
      ),
      child: Stack(
        children: [
          // مجموعة نجوم وأشكال صغيرة موزعة بدقة

          // نجمة بالأعلى يسار
          Positioned(top: 60, left: 30, child: _buildStar(Icons.star_rounded, 30)),

          // شكل هندسي صغير جداً يمين العنوان
          Positioned(top: 100, right: 40, child: _buildStar(Icons.auto_awesome, 30)),

          // نجمة صغيرة في الفراغ الجانبي
          Positioned(top: 250, left: 20, child: _buildStar(Icons.star_outline_rounded, 20)),

          // شكل "بريق" صغير جهة اليمين
          Positioned(top: 400, right: 25, child: _buildStar(Icons.brightness_7_rounded, 20)),

          // نجمة قريبة من أسفل البطاقة الأولى
          Positioned(bottom: 300, left: 40, child: _buildStar(Icons.star_rounded, 20)),

          // شكل هندسي بسيط فوق الزر
          Positioned(bottom: 180, right: 50, child: _buildStar(Icons.grain, 20)),

          // نجمة أخيرة بالزاوية السفلى
          Positioned(bottom: 60, left: 30, child: _buildStar(Icons.auto_awesome_mosaic_rounded, 15)),

          // محتوى الصفحة الأساسي (SafeArea والـ Column)
          child,
        ],
      ),
    );
  }

  // دالة لرسم النجوم الصغيرة جداً لضمان عدم تأثيرها على القراءة
  Widget _buildStar(IconData icon, double size) {
    return Opacity(
      opacity: 0.15, // شفافة جداً لتبدو كخلفية
      child: Icon(
        icon,
        size: size,
        color: ColorManager.primary, // نفس لون الهوية البصرية لكن شفاف
      ),
    );
  }
}