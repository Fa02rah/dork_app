import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/views/home/details/widgets/booking_background.dart';
import 'widget/notification_card.dart'; 
import 'notification_details_screen.dart'; // تأكدي من صحة هذا الاستيراد

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyNotifications = [
      {"title": "اقتراب موعد دورك", "body": "باقي شخصين فقط على دورك، يرجى الاستعداد."},
      {"title": "تم تأكيد الحجز بنجاح", "body": "مرحباً بك، تم حجز دورك بنجاح برقم #25."},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإشعارات',
          style: TextStyle(color: ColorManager.textDark, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorManager.gradientStart,
        elevation: 0,
        centerTitle: true,
      ),
      body: BookingBackground(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          itemCount: dummyNotifications.length,
          itemBuilder: (context, index) {
            final item = dummyNotifications[index];
            return NotificationCard(
              title: item["title"]!,
              body: item["body"]!,
              onTap: () {
                // تعديل السطر ليعمل مع الـ const بشكل سليم وتمرير الـ arguments
                Get.to(NotificationDetailsScreen(), arguments: item);
              },
            );
          },
        ),
      ),
    );
  }
}