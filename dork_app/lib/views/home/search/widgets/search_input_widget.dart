import 'package:flutter/material.dart';
// استيراد الـ Widget المشترك الخاص بكِ
import '../../../../core/widgets shared/custom_text_field.dart';
class SearchInputWidget extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;

  const SearchInputWidget({
    super.key,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // استخدمنا Padding بدلاً من margin داخل حاوية جديدة للحفاظ على تناسق الأبعاد
      padding: const EdgeInsets.all(20),
      child: CustomTextField(
        controller: controller,
        onChanged: onChanged,
        hintText: "ابحث عن خدماتك...",
        prefixIcon: Icons.search,
        keyboardType: TextInputType.text,
      ),
    );
  }
}