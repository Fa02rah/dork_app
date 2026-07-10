import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/views/home/details/widgets/booking_background.dart';
// استيراد كارد التفاصيل من مجلد الـ widget
import 'widget/notification_detail_card.dart'; 

class NotificationDetailsScreen extends StatelessWidget {
  // الـ Constructor بدون const (صحيح 100%)
  NotificationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال البيانات الممررة من الواجهة السابقة عبر GetX arguments
    final Map<String, String> notification = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تفاصيل الإشعار',
          style: TextStyle(color: ColorManager.textDark, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorManager.gradientStart,
        elevation: 0,
        // 🔥 أضفنا const هنا قبل الـ IconButton والأيقونة الثابتة
        leading: const IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorManager.textDark),
          onPressed: null, // سنقوم بالعودة عبر دالة الـ IconButton نفسها أو نتركها للـ Get.back بالأسفل
        ),
        // للتأكد من عمل الزر بشكل صحيح مع GetX، يفضل كتابته هكذا:
        /*
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: ColorManager.textDark),
          onPressed: () => Get.back(), 
        ),
        */
        centerTitle: true,
      ),
      body: BookingBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // استدعاء الويدجت المفصل وبسطر واحد مريح
          child: NotificationDetailCard(
            title: notification["title"]!,
            body: notification["body"]!,
          ),
        ),
      ),
    );
  }
}