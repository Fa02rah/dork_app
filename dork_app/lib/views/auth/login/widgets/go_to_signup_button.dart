import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';
import '../../../../core/theme/text_style.dart';

// نستخدم GetView<LoginController> للوصول المباشر للكنترولر
class GoToSignUpButton extends GetView<LoginController> {
  const GoToSignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // استدعاء الدالة الموجودة في الـ Controller مباشرة
      onPressed: () => controller.goToSignUp(),
      style: TextButton.styleFrom(
        // إزالة الهوامش الافتراضية إذا لزم الأمر
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child: Text(
        'ليس لديك حساب؟ إنشاء حساب جديد',
        style: TextStyles.bodyText.copyWith(
          fontWeight: FontWeight.bold,
          // اختيارياً: إضافة خط تحت النص مثل التصميم
          decoration: TextDecoration.underline,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}