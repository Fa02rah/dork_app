import 'package:flutter/material.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/theme/text_style.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // الشعار
        Image.asset(ImageAssets.appLogo, height: 70),
        const SizedBox(height: 50),

        // العنوان العريض
        Text(
          'مرحباً بك في دورك',
          style: TextStyles.headLine,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        // العنوان الفرعي
        Text(
          'ادخل تفاصيلك للبدء',
          style: TextStyles.bodyText.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}