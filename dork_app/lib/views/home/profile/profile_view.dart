import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';
import '../service_booking/widgets/booking_background.dart';
import 'controller/profile_controller.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info_card.dart';
import 'widgets/profile_info_row.dart';
import 'widgets/profile_settings_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BookingBackground(
        child: SafeArea(
          child: Column(
            children: [
              const ProfileHeader(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),

                      // الأواتار المنفصل (يقرأ الصورة ديناميكياً)
                      Obx(() => ProfileAvatar(
                        imageUrl: controller.userImageUrl.value,
                      )),

                      const SizedBox(height: 15),

                      // اسم العميل مربوط بالـ ColorManager.black
                      Obx(() => Text(
                        controller.userName.value,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      )),

                      // نص العميل المميز مربوط بالـ ColorManager.grey
                      Text(
                        "العميل المميز",
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: ColorManager.grey.withOpacity(0.7),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // 1. كرت المعلومات الشخصية
                      Obx(() => ProfileInfoCard(
                        title: "المعلومات الشخصية",
                        children: [
                          ProfileInfoRow(icon: Icons.translate_rounded, label: "الاسم", value: controller.userName.value),
                          Divider(height: 20, thickness: 0.5, color: ColorManager.grey.withOpacity(0.2)),
                          ProfileInfoRow(icon: Icons.email_outlined, label: "البريد الإلكتروني", value: controller.email.value),
                          Divider(height: 20, thickness: 0.5, color: ColorManager.grey.withOpacity(0.2)),
                          ProfileInfoRow(icon: Icons.lock_outline_rounded, label: "كلمة المرور", value: controller.password.value),
                        ],
                      )),

                      const SizedBox(height: 20),

                      // 2. كرت إحصائيات الحجز
                      Obx(() => ProfileInfoCard(
                        title: "إحصائيات الحجز",
                        children: [
                          ProfileInfoRow(icon: Icons.calendar_today_rounded, label: "الحجوزات القادمة", value: controller.upcomingBookings.value.toString()),
                          Divider(height: 20, thickness: 0.5, color: ColorManager.grey.withOpacity(0.2)),
                          ProfileInfoRow(icon: Icons.assignment_turned_in_outlined, label: "الحجوزات السابقة", value: controller.pastBookings.value.toString()),
                        ],
                      )),

                      const SizedBox(height: 20),

                      // 3. كرت الإعدادات المستقل (الذي يقرأ خلفيته من ColorManager.cardCreamBg تلقائياً)
                      const ProfileSettingsCard(),

                      const SizedBox(height: 30),

                      // زر تسجيل الخروج متناسق مع اللون البرتقالي والأبيض
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: () => controller.logout(),
                          icon: const Icon(Icons.logout_rounded, color: ColorManager.white, size: 20),
                          label: const Text(
                            "تسجيل الخروج",
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
                      const SizedBox(height: 30),
                    ],
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