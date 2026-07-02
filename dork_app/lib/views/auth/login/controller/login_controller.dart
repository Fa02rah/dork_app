import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // 1. استيراد المكتبة
import '../../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    if (loginFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // محاكاة الاتصال بقاعدة البيانات (API Call)
        await Future.delayed(const Duration(seconds: 2));

        // 2. التعديل الجوهري: حفظ حالة تسجيل الدخول في الهاتف
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);

        // يمكنك أيضاً حفظ بريد المستخدم إذا احتجت لعرضه في الصفحة الرئيسية
        await prefs.setString('userEmail', emailController.text);

        print("تم تسجيل الدخول وحفظ الحالة بنجاح!");

        // 3. الانتقال للصفحة الرئيسية واستبدال كافة المسارات السابقة لمنع العودة للخلف
        Get.offAllNamed(AppRoutes.HOME);

      } catch (e) {
        Get.snackbar("خطأ", "فشل تسجيل الدخول، حاول مرة أخرى");
      } finally {
        isLoading.value = false;
      }
    }
  }

  void goToSignUp() {
    Get.toNamed(AppRoutes.SIGNUP);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}