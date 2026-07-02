import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/color_manager.dart';
import 'controller/service_booking_controller.dart';
import 'widgets/booking_background.dart';
import 'widgets/waiting_time_card.dart';
import 'widgets/crowd_status_gauge.dart';
import 'widgets/provider_info_section.dart';
import 'widgets/service_description_section.dart';
import 'widgets/booking_action_button.dart';
// 👇 1. استدعاء الهيدر الجديد المنفصل من مجلد الـ widgets الخاص بالصفحة
import 'widgets/booking_header.dart';

class ServiceBookingView extends GetView<ServiceBookingController> {
  const ServiceBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: BookingBackground(
        child: SafeArea(
          child: Column(
            children: [
              // 👇 2. استبدال الدالة القديمة بالويدجت المستقل وتمرير العنوان له
              const BookingHeader(title: "حجز موعد جديد"),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),

                      // اللوجو العلوي - يتحدث ديناميكياً
                      Obx(() => ProviderInfoSection(
                        image: controller.providerLogo.value,
                        name: controller.providerName.value,
                        branch: controller.branchName.value,
                      )),

                      const SizedBox(height: 45),

                      // بطاقة الوقت (ديناميكية)
                      Obx(() => WaitingTimeCard(
                        waitTime: controller.waitTime.value,
                        waitingCount: controller.waitingCount.value,
                      )),

                      const SizedBox(height: 30),

                      // مؤشر الزحام (ديناميكي)
                      Obx(() => CrowdStatusGauge(
                        status: controller.crowdStatus.value,
                      )),

                      const SizedBox(height: 40),

                      // وصف الخدمة المعدل (نصوص فقط لجمالية الواجهة)
                      ServiceDescriptionSection(
                        title: controller.service.title,
                        description: controller.service.description,
                      ),

                      const SizedBox(height: 60),

                      // زر الحجز (مستدعى من الويدجيت الخاص به)
                      BookingActionButton(
                        onPressed: () => controller.confirmBooking(),
                      ),

                      const SizedBox(height: 40),
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

// 🌟 تمت إزالة الدالة الفرعية _buildHeader من هنا كلياً لتنظيف الواجهة الأساسية
}