import 'dart:io'; // 🌟 مهم جداً: لقراءة ملف الصورة من ذاكرة الهاتف عبر كلاس File
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/color_manager.dart';
import '../controller/edit_profile_controller.dart';

class EditAvatarSection extends GetView<EditProfileController> {
  const EditAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // الـ Obx هنا تراقب التغييرات في الكنترولر وتعيد رسم الأواتار فوراً عند اختيار صورة
          Obx(() {
            return CircleAvatar(
              radius: 60,
              backgroundColor: ColorManager.grey.withOpacity(0.1),

              // 🌟 التعديل الأساسي هنا:
              // إذا كان مسار الصورة غير فارغ، نقوم بتحويل المسار النصي إلى ملف صورة حقيقي وعرضه
              backgroundImage: controller.selectedImagePath.value.isNotEmpty
                  ? FileImage(File(controller.selectedImagePath.value))
                  : null,

              // إذا كانت الصورة فارغة، نعرض الأيقونة الافتراضية للشخص كـ child
              child: controller.selectedImagePath.value.isEmpty
                  ? const Icon(
                Icons.person,
                size: 60,
                color: ColorManager.grey,
              )
                  : null, // عند وجود صورة، نلغي الـ child لكي تظهر الصورة الخلفية بوضوح
            );
          }),

          // زر الكاميرا البرتقالي للتفاعل واختيار الصورة
          GestureDetector(
            onTap: () => controller.pickImage(),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: ColorManager.accent,
              child: Icon(
                Icons.camera_alt_rounded,
                size: 16,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}