


import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ticket_controller.dart';

class TicketButtonsWidget extends GetView<TicketController> {
  const TicketButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: controller.cancelTicket,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.error.withOpacity(0.15),
                  foregroundColor: ColorManager.error,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'إلغاء',
                  style: TextStyles.buttonText.copyWith(
                    color: ColorManager.error,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: controller.postponeTicket,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.accent.withOpacity(0.15),
                  foregroundColor: ColorManager.accent,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'تأجيل',
                  style: TextStyles.buttonText.copyWith(
                    color: ColorManager.accent,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.bookNewTicket,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.primary,
              foregroundColor: ColorManager.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
            child: Text(
              'حجز جديد',
              style: TextStyles.buttonText,
            ),
          ),
        ),
      ],
    );
  }
}