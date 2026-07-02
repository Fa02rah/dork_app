import 'package:flutter/material.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/image_assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. اللوجو في المنتصف
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              ImageAssets.appLogo, height: 70
            ),
          ),
        ),

        const SizedBox(height: 10),

        // 2. اسم المستخدم باللون الأزرق الداكن (Primary) للفخامة
        const Text(
          "أهلاً بك، ابدأ رحلتك من هنا",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            color: ColorManager.primary, // تم تغيير اللون هنا
          ),
        ),

        // 3. جملة التشجيع باللون البرتقالي (Accent) لجذب الانتباه
        const Text(
          "ابحث عن دورك الآن",
          style: TextStyle(
            fontSize: 18,
            color: ColorManager.accent, // تم تغيير اللون هنا للبرتقالي
            fontWeight: FontWeight.w500,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }
}