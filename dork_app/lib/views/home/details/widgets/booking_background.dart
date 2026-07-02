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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.gradientStart,
            ColorManager.background,
            ColorManager.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          // 🔵 الزخارف العلوية والجانبية (السابقة)
          Positioned(top: -50, right: -50, child: _buildDecorativeCircle(150, 0.08)),
          Positioned(top: 300, left: -30, child: _buildDecorativeCircle(100, 0.05)),

          // 🌟 إضافة زخارف سفلية ناعمة جداً
          // دائرة سفلية كبيرة وشفافة لتعطي ثقلاً بصرياً متزناً
          Positioned(bottom: -80, left: -50, child: _buildDecorativeCircle(200, 0.04)),
          // أشكال دائرية صغيرة متناثرة في الأسفل لإضافة تفاصيل "مرحة"
          Positioned(bottom: 100, right: 30, child: _buildDecorativeCircle(30, 0.06)),
          Positioned(bottom: 50, left: 80, child: _buildDecorativeCircle(20, 0.08)),

          // النجوم (تم الحفاظ عليها)
          Positioned(top: 100, left: 30, child: _buildStar(Icons.star_rounded, 26)),
          Positioned(top: 140, right: 40, child: _buildStar(Icons.auto_awesome, 24)),
          Positioned(bottom: 250, left: 40, child: _buildStar(Icons.star_rounded, 18)),
          Positioned(bottom: 120, right: 45, child: _buildStar(Icons.auto_awesome_mosaic_rounded, 16)),

          // المحتوى الأساسي
          child,
        ],
      ),
    );
  }

  Widget _buildDecorativeCircle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.primary.withOpacity(opacity),
      ),
    );
  }

  Widget _buildStar(IconData icon, double size) {
    return Opacity(
      opacity: 0.12,
      child: Icon(
        icon,
        size: size,
        color: ColorManager.primary,
      ),
    );
  }
}