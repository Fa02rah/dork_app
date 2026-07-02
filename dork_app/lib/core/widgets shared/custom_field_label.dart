import 'package:flutter/material.dart';
import '../constants/color_manager.dart'; // تأكدي من صحة المسار لملف الألوان [cite: 2]
class CustomFieldLabel extends StatelessWidget {
  final String text; // النص المراد عرضه (مثال: الاسم الكامل)
  const CustomFieldLabel({
    super.key,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ColorManager.black, // مستدعى من الـ constants الخاصة بمشروعكِ [cite: 2]
        ),
      ),
    );
  }
}