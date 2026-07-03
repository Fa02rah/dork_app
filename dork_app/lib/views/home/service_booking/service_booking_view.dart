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
              const BookingHeader(title: "حجز موعد جديد"),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Obx(
                        () => ProviderInfoSection(
                          image: controller.providerLogo.value,
                          name: controller.providerName.value,
                          branch: controller.branchName.value,
                        ),
                      ),
                      const SizedBox(height: 45),
                      Obx(
                        () => WaitingTimeCard(
                          waitTime: controller.waitTime.value.toString(),
                          waitingCount: controller.waitingCount.value,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Obx(
                        () => CrowdStatusGauge(
                          status: controller.crowdStatus.value,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // ✅ استخدم service.value
                      Obx(
                        () => ServiceDescriptionSection(
                          title: controller.service.value.title,
                          description: controller.service.value.description,
                        ),
                      ),

                      const SizedBox(height: 60),
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
}
