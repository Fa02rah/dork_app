import 'package:flutter/material.dart';
// استيراد ملف الألوان
import '../../../../core/constants/color_manager.dart';

class WaitingTimeCard extends StatelessWidget {
  final String waitTime;
  final int waitingCount;

  const WaitingTimeCard({super.key, required this.waitTime, required this.waitingCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // استخدام اللون المخصص لخلفية الكارد من الملف
        color: ColorManager.waitCardBg,
        borderRadius: BorderRadius.circular(20),
        // استخدام لون الحدود المخصص
        border: Border.all(color: ColorManager.waitCardBorder),
      ),
      child: Column(
        children: [
          const Text(
              "وقت الانتظار المتوقع:",
              style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: ColorManager.black)
          ),
          Text(
              waitTime,
              style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.accent // تمييز الوقت باللون البرتقالي الرسمي
              )
          ),
          const SizedBox(height: 8), // إضافة مسافة بسيطة للترتيب
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: ColorManager.primary, // تغيير لون الخلفية للأزرق الرسمي ليعطي تبايناً أجمل
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
                "عملاء في الانتظار: $waitingCount",
                style: const TextStyle(
                    fontFamily: 'Cairo',
                    color: ColorManager.white,
                    fontSize: 12
                )
            ),
          ),
        ],
      ),
    );
  }
}