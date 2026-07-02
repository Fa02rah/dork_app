import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../onboarding_controller/onboarding_controller.dart';
import '../../../core/constants/color_manager.dart';

class SkipButton extends GetView<OnboardingController> {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // الزر يختفي تلقائياً في الصفحة الأخيرة
      if (controller.isLastPage) return const SizedBox.shrink();

      return Positioned(
        top: 20, // أعدنا ضبط المساحة العلوية قليلاً
        left: 20, // جهة اليسار لتناسب اتجاه التطبيق العربي (السحب من اليسار لليمين)
        child: InkWell(
          onTap: () => controller.skipOnboarding(),
          borderRadius: BorderRadius.circular(20), // ليكون تأثير الضغط دائرياً أيضاً
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
            decoration: BoxDecoration(
              // 1. الألوان المناسبة للواجهة البيضاء
              color: ColorManager.primary.withOpacity(0.1), // خلفية فاتحة جداً من لون التطبيق
              borderRadius: BorderRadius.circular(20), // حواف دائرية عصرية
              border: Border.all(color: ColorManager.primary.withOpacity(0.3)), // إطار رفيع جداً
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "تخطي",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary, // النص باللون الأساسي
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(width: 5),
                // إضافة أيقونة بسيطة تعطي لمسة جمالية
                Icon(
                  Icons.arrow_back_ios_new_rounded, // أيقونة سهم لليسار (تخطي للخلف بالنسبة للاتجاه)
                  size: 14,
                  color: ColorManager.primary,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}