import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets shared/custom_text_field.dart';
import '../../../routes/app_routes.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدمنا GestureDetector مباشرة حول الـ TextField
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.SEARCH);
      },
      // لا نحتاج IgnorePointer
      child: AbsorbPointer(
        // AbsorbPointer أفضل هنا لأنه يمتص اللمس ويمنع الـ TextField من التفاعل
        child: CustomTextField(
          controller: TextEditingController(),
          hintText: "...بحث عن عيادات، بنوك، دوائر",
          prefixIcon: Icons.search,
          keyboardType: TextInputType.none,
        ),
      ),
    );
  }
}
