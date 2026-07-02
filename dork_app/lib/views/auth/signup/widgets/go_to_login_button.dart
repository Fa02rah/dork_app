import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/text_style.dart';

class GoToLoginButton extends StatelessWidget {
  const GoToLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // بما أننا نريد العودة لصفحة تسجيل الدخول التي أتينا منها
      onPressed: () => Get.back(),
      child: Text(
        'إذا كان لديك حساب؟ تسجيل الدخول',
        style: TextStyles.bodyText.copyWith(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline, // إضافة خط تحت النص للجمالية
        ),
      ),
    );
  }
}