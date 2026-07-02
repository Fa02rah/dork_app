import 'package:flutter/material.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/theme/text_style.dart';
class SignupHeader extends StatelessWidget {
  const SignupHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Image.asset(ImageAssets.appLogo, height: 70),
        const SizedBox(height: 20),
        // العنوان الرئيسي كما في الصورة
        Text(
          'إنشاء حساب جديد',
          style: TextStyles.headLine,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        // يمكنك إضافة نص فرعي إذا أردت أو الاكتفاء بالعنوان
        Text(
          'املأ البيانات التالية للانضمام إلينا',
          style: TextStyles.bodyText.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}