import 'package:flutter/material.dart';
import 'package:get/get.dart';
// تأكد من صحة مسارات الملفات لديك
import '../../../core/widgets shared/custom_text_field.dart';
import '../controller/home_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // الوصول إلى الكنترولر المحقون مسبقاً في HomeView
    final HomeController controller = Get.find();

    return CustomTextField(
      controller: controller.searchController,
      hintText: "...بحث عن عيادات، بنوك، دوائر",
      prefixIcon: Icons.search,
      keyboardType: TextInputType.text,

      // الاستدعاء السحري: هنا نقوم بربط الكتابة بدالة الفلترة
      onChanged: (value) {
        controller.filterCategories(value);
      },
    );
  }
}