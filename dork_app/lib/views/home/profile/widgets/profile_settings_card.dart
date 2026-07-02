import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../core/widgets shared/custom_field_label.dart';
import '../../../../core/widgets shared/custom_settings_title.dart';
import '../../../../core/widgets shared/custom_text_field.dart';
import '../controller/profile_controller.dart'; // 🌟 تحديث: استدعاء كنترولر البروفايل الرئيسي
import '../edit_profile/edit_profle_view.dart';

class ProfileSettingsCard extends StatelessWidget {
  const ProfileSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // 🌟 تحديث: ربط الـ ProfileController للوصول إلى كلمة المرور الحقيقية وتحديثها
    final ProfileController profileController = Get.find<ProfileController>();

    final TextEditingController currentPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.cardCreamBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. زر تعديل الملف الشخصي
          CustomSettingsTile(
            icon: Icons.edit_outlined,
            title: "تعديل الملف الشخصي",
            onTap: () {
              Get.to(() => const EditProfileView());
            },
          ),

          Divider(height: 1, thickness: 0.5, color: ColorManager.grey.withOpacity(0.2), indent: 20, endIndent: 20),

          // 2. زر تغيير كلمة المرور
          CustomSettingsTile(
            icon: Icons.lock_open_rounded,
            title: "تغيير كلمة المرور",
            onTap: () {
              Get.bottomSheet(
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: const BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: ColorManager.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          const Text(
                            "تغيير كلمة المرور",
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorManager.black,
                            ),
                          ),
                          const SizedBox(height: 25),

                          const CustomFieldLabel(text: "كلمة المرور الحالية:"),
                          CustomTextField(
                            controller: currentPasswordController,
                            hintText: "أدخل كلمة المرور الحالية",
                            prefixIcon: Icons.lock_outline_rounded,
                            isPassword: true,
                          ),

                          const SizedBox(height: 20),

                          const CustomFieldLabel(text: "كلمة المرور الجديدة:"),
                          CustomTextField(
                            controller: newPasswordController,
                            hintText: "أدخل كلمة المرور الجديدة",
                            prefixIcon: Icons.lock_clock_outlined,
                            isPassword: true,
                          ),

                          const SizedBox(height: 35),

                          // زر تحديث كلمة المرور البرتقالي
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                // 🌟 التحقق الأول: التأكد من أن الحقول ليست فارغة
                                if (currentPasswordController.text.isEmpty || newPasswordController.text.isEmpty) {
                                  Get.snackbar(
                                    "تنبيه",
                                    "يرجى ملء جميع الحقول أولاً",
                                    backgroundColor: Colors.redAccent,
                                    colorText: ColorManager.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                // 🌟 التحقق الثاني: التأكد من أن كلمة المرور الحالية المكتوبة تطابق القديمة المخزنة
                                if (currentPasswordController.text != profileController.password.value) {
                                  Get.snackbar(
                                    "خطأ",
                                    "كلمة المرور الحالية غير صحيحة",
                                    backgroundColor: Colors.redAccent,
                                    colorText: ColorManager.white,
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                // 🌟 الحفظ الحقيقي والفعلي: تحديث قيمة كلمة المرور في الـ ProfileController
                                profileController.password.value = newPasswordController.text;

                                // تفريغ الحقول وإغلاق اللوحة
                                currentPasswordController.clear();
                                newPasswordController.clear();
                                Get.back();

                                // رسالة النجاح المنظمة والمطابقة لألوانكِ
                                Get.snackbar(
                                  '',
                                  '',
                                  titleText: const Text(
                                    "تم بنجاح",
                                    style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 16, color: ColorManager.black),
                                  ),
                                  messageText: Text(
                                    "تم تحديث كلمة المرور بنجاح",
                                    style: TextStyle(fontFamily: 'Cairo', fontSize: 14, color: ColorManager.black.withOpacity(0.7)),
                                  ),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: ColorManager.white.withOpacity(0.95),
                                  borderRadius: 15,
                                  margin: const EdgeInsets.all(15),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorManager.accent,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                elevation: 0,
                              ),
                              child: const Text(
                                "تحديث كلمة المرور",
                                style: TextStyle(fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.bold, color: ColorManager.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),

          Divider(height: 1, thickness: 0.5, color: ColorManager.grey.withOpacity(0.2), indent: 20, endIndent: 20),

          // 3. زر إعدادات الإشعارات
          CustomSettingsTile(
            icon: Icons.notifications_none_rounded,
            title: "إعدادات الإشعارات",
            onTap: () {
              print("الانتقال لإعدادات الإشعارات");
            },
          ),
        ],
      ),
    );
  }
}