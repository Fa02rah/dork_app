import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // تأكد من وجود المكتبة
import '../../../routes/app_routes.dart'; // تأكد من تعريف المسارات
class OnboardingController extends GetxController {
  // 1. متحكم الـ PageView للتحكم بالتمرير برمجياً
  final PageController pageController = PageController();
  // 2. متغير "مراقب" (Observable) لحفظ رقم الصفحة الحالية
  var currentPageIndex = 0.obs;
  // خاصية لمعرفة هل نحن في الصفحة الأخيرة بسهولة
  bool get isLastPage => currentPageIndex.value == 2; // بافتراض وجود 3 صفحات (0, 1, 2)
  // دالة تُستدعى عند تغيير الصفحة يدوياً (Drag)
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }
  // دالة للذهاب للصفحة التالية
  void nextPage() {
    if (!isLastPage) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      finishOnboarding();
    }
  }

  // دالة التخطي (Skip)
  void skipOnboarding() {
    finishOnboarding();
  }

  // دالة إنهاء الـ Onboarding وحفظ الحالة
  Future<void> finishOnboarding() async {
    // حفظ أن المستخدم أتم مشاهدة الواجهات في الذاكرة الدائمة
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    // الانتقال لصفحة تسجيل الدخول ومسح سجل الصفحات السابق
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}