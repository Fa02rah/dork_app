import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ticket_controller.dart';

class TicketInfoWidget extends GetView<TicketController> {
  const TicketInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.gradientStart,
            ColorManager.gradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorManager.borderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.cardShadowColor,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow('رقم تذكرتك', controller.ticketNumber.value),
          SizedBox(height: 16),
          _buildInfoRow('الدور الحالي...', controller.currentTurn.value),
          SizedBox(height: 16),
          _buildInfoRow(
            '${controller.peopleAhead.value} أشخاص أمامك',
            '',
            isHighlight: true,
          ),
          SizedBox(height: 16),
          _buildInfoRow(
            'الوقت المقدر لانتظارك: ${controller.waitTime.value} دقيقة',
            '',
            isHighlight: true,
          ),
        ],
      ),
    ));
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isHighlight 
              ? TextStyles.bodyText.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                )
              : TextStyles.bodyText,
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
    );
  }
}