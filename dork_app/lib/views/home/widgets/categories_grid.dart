import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../controller/home_controller.dart';
import '../../../models/category_model.dart';
// استدعاء ملف الروابط الأصلي للتطبيق
import '../../../routes/app_routes.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(() {
      if (controller.foundCategories.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("لا توجد نتائج مطابقة", style: TextStyle(fontFamily: 'Cairo')),
          ),
        );
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 25,
          crossAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: controller.foundCategories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // الآن سيقرأ من الملف المستورد في الأعلى بشكل صحيح
              Get.toNamed(
                AppRoutes.CATEGORY_DETAILS,
                arguments: controller.foundCategories[index],
              );
            },
            child: CategoryCard(
              category: controller.foundCategories[index],
            ),
          );
        },
      );
    });
  }
}

// تعديل الاسم هنا من AppRoutes إلى CategoryCard لحل المشكلة
class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorManager.accent.withOpacity(0.25),
                blurRadius: 20,
                offset: const Offset(0, 8),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Image.asset(
            category.image,
            height: 35,
            width: 35,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          category.name,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}