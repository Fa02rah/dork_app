import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();

  // 1. تحديث المتحكمات: حذف الهاتف وإضافة تأكيد كلمة المرور
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController(); // الحقل الجديد

  var isLoading = false.obs;

  void signup() async {
    // تشغيل الـ Validators المرتبطة في الواجهة
    if (signupFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // محاكاة الاتصال بقاعدة البيانات
        await Future.delayed(const Duration(seconds: 2));

        // 2. تحديث بيانات الطباعة للتأكد من الجاهزية
        print("Name: ${nameController.text}");
        print("Email: ${emailController.text}");
        print("Password: ${passwordController.text}");
        // ملاحظة: لا نحتاج لإرسال "تأكيد كلمة المرور" للسيرفر، فقط نستخدمه للتحقق محلياً

        Get.snackbar(
          "نجاح",
          "تم التحقق وتطابق كلمات المرور بنجاح",
          backgroundColor: Colors.green.withOpacity(0.5),
          colorText: Colors.white,
        );

      } catch (e) {
        Get.snackbar(
          "خطأ",
          "حدث خطأ أثناء الاتصال",
          backgroundColor: ColorManager.error,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    // 3. تحديث عملية الـ dispose لتشمل المتحكم الجديد وتزيل الهاتف
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose(); // إغلاق المتحكم الجديد
    super.onClose();
  }
}