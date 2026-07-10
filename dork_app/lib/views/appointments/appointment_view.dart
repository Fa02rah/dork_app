
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color_manager.dart';
import '../../core/theme/text_style.dart';
import 'controller/appointments_controller.dart';
import 'widgets/appoinment_card.dart';
import '../ticket/ticket_view.dart';
import '../home/details/widgets/booking_background.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentsController controller =
        Get.find<AppointmentsController>();

    return Scaffold(
      backgroundColor: ColorManager.gradientStart,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // ✅ شفاف
        elevation: 0, // ✅ بدون ظل
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/home'),
          icon: Icon(Icons.arrow_back, color: ColorManager.primary, size: 28),
        ),
        title: Text(
          'مواعيدي النشطة',
          style: TextStyles.headLine.copyWith(
            fontSize: 20,
            color: ColorManager.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: BookingBackground(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          }

          if (controller.appointments.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_busy,
                    size: 80,
                    color: ColorManager.textGrey.withOpacity(0.4),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد مواعيد',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorManager.textGrey,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.appointments.length,
            itemBuilder: (context, index) {
              final appointment = controller.appointments[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => TicketView(appointmentData: appointment));
                },
                child: AppoinmentCard(appointment: appointment),
              );
            },
          );
        }),
      ),
    );
  }
}
