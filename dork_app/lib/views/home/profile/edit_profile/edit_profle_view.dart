import 'package:dork_app/views/home/profile/edit_profile/widgets/edit_avatatr_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../core/widgets shared/custom_field_label.dart';
import '../../../../core/widgets shared/custom_text_field.dart';
import '../../service_booking/widgets/booking_background.dart';
import 'controller/edit_profile_controller.dart';
import 'widgets/edit_profile_header.dart';
class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    // التأكد من حقن الكنترولر الخاص بالتعديل في الذاكرة
    if (!Get.isRegistered<EditProfileController>()) {
      Get.put(EditProfileController());
    }
    return Scaffold(
      backgroundColor: Colors.transparent, // شفافة لكي تبرز نقوش الخلفية المشتركة
      body: BookingBackground(
        child: SafeArea(
          child: Column(
            children: [
              // الهيدر المستقل والنظيف
              const EditProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Directionality(
                    textDirection: TextDirection.rtl, // دعم الاتجاه العربي الكامل للـ Form
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        // قسم الأواتار المتصل بمعرض الصور الحقيقي
                        const EditAvatarSection(),
                        const SizedBox(height: 35),
                        // حقل تعديل الاسم الكامل
                        const CustomFieldLabel(text: "الاسم الكامل:"),
                        CustomTextField(
                          controller: controller.nameController,
                          hintText: "أدخل اسمك الكامل",
                          prefixIcon: Icons.person_outline_rounded,
                        ),
                        const SizedBox(height: 25),
                        // حقل تعديل البريد الإلكتروني
                        const CustomFieldLabel(text: "البريد الإلكتروني:"),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: "أدخل بريدك الإلكتروني",
                          prefixIcon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 50),
                        // زر حفظ التعديلات البرتقالي المتناسق
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => controller.saveChanges(),
                            icon: const Icon(Icons.check_rounded, color: ColorManager.white, size: 20),
                            label: const Text(
                              "حفظ التعديلات",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.accent,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              elevation: 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}