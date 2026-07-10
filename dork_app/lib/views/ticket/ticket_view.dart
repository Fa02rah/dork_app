import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color_manager.dart';
import '../../core/theme/text_style.dart';
import '../../views/home/details/widgets/booking_background.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic>? appointmentData;

  const TicketView({super.key, this.appointmentData});

  @override
  Widget build(BuildContext context) {
    final ticketNumber = appointmentData?['ticket'] ?? 'A-14';
    final currentTurn = 'A-${int.parse(ticketNumber.split('-')[1]) - 2}';
    final peopleAhead = 2;
    final waitTime = 15;

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: ColorManager.gradientStart, // ✅ شفاف
        elevation: 0, // ✅ بدون ظل
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: ColorManager.primary, size: 28),
        ),
        title: Text(
          'تفاصيل الحجز',
          style: TextStyles.headLine.copyWith(
            fontSize: 20,
            color: ColorManager.primary,
          ),
        ),
        centerTitle: true,
        // ✅ إذا بدك أزرار إضافية
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.search, color: ColorManager.primary),
        //   ),
        // ],
      ),
      body: BookingBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('حجزك النشط', style: TextStyles.headLine),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.cardShadowColor,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: ColorManager.borderLight),
                ),
                child: Column(
                  children: [
                    _buildInfoRow('رقم تذكرتك', ticketNumber),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow('الدور الحالي', currentTurn),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow(
                      '$peopleAhead أشخاص أمامك',
                      '',
                      isHighlight: true,
                    ),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow(
                      'الوقت المقدر للانتظار: $waitTime دقيقة',
                      '',
                      isHighlight: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          'تم التأجيل',
                          'تم تأجيل حجزك بنجاح',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: ColorManager.waitCardBorder,
                          colorText: ColorManager.white,
                          duration: const Duration(seconds: 3),
                          margin: const EdgeInsets.all(10),
                          borderRadius: 12,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.waitCardBorder,
                        foregroundColor: ColorManager.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'تأجيل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.snackbar(
                          'تم الإلغاء',
                          'تم إلغاء حجزك بنجاح',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: ColorManager.error,
                          colorText: ColorManager.white,
                          duration: const Duration(seconds: 3),
                          margin: const EdgeInsets.all(10),
                          borderRadius: 12,
                        );
                        Future.delayed(const Duration(seconds: 1), () {
                          Get.back();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.error,
                        foregroundColor: ColorManager.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'إلغاء',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/service-booking');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.accent,
                    foregroundColor: ColorManager.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'حجز جديد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isHighlight ? ColorManager.primary : ColorManager.textGrey,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isHighlight ? ColorManager.accent : ColorManager.primary,
              ),
            ),
        ],
      ),
    );
  }
}
