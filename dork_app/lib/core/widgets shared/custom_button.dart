import 'package:flutter/material.dart';
import '../constants/color_manager.dart';
import '../theme/text_style.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: ColorManager.accent,
        borderRadius: BorderRadius.circular(15),

      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Center(
          child: Text(text, style: TextStyles.buttonText),
        ),
      ),
    );
  }
}