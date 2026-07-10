import 'package:flutter/material.dart';
import 'package:dork_app/core/constants/color_manager.dart';

class NotificationDetailCard extends StatelessWidget {
  final String title;
  final String body;

  const NotificationDetailCard({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ColorManager.borderLight, width: 1),
        boxShadow: const [
          BoxShadow(
            color: ColorManager.cardShadowColor,
            blurRadius: 20,
            offset: Offset(0, 8),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // رأس الكارد: الأيقونة مع العنوان
          Row(
            children: [
              const Icon(
                Icons.info_outline_rounded, 
                color: ColorManager.primary, 
                size: 28,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: ColorManager.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // خط فاصل ناعم
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: ColorManager.borderLight, thickness: 1),
          ),
          // نص الإشعار الكامل (Body)
          Text(
            body,
            style: const TextStyle(
              color: ColorManager.textDark,
              fontSize: 16,
              height: 1.6, // مسافة مريحة للقراءة
            ),
          ),
        ],
      ),
    );
  }
}