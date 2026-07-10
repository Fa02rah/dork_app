

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../home/controller/home_controller.dart';

class AppointmentsController extends GetxController {
  var appointments = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadAppointments();
  }

  void loadAppointments() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      appointments.value = [
        {
          'type': 'bank',
          'typeName': 'بنوك',
          'name': 'خالد محمد',
          'location': 'بنك الرافدين',
          'ticket': 'A-14',
          'time': '10:30 صباحاً',
          'date': 'الخميس، 7 مايو',
          'status': 'completed',
          'statusText': 'قائم',
        },
        {
          'type': 'clinic',
          'typeName': 'عيادات',
          'name': 'خالد محمد',
          'location': 'عيادة الأمل الطبية',
          'ticket': 'C-05',
          'time': '2:00 مساءً',
          'date': 'الخميس، 7 مايو',
          'status': 'completed',
          'statusText': 'قائم',
        },
        {
          'type': 'government',
          'typeName': 'حكومي',
          'name': 'خالد محمد',
          'location': 'وزارة العدل',
          'ticket': 'G-22',
          'time': '4:45 مساءً',
          'date': 'السبت، 9 مايو',
          'status': 'pending',
          'statusText': 'قيد الانتظار',
        },
      ];
      isLoading.value = false;
    });
  }

  IconData getIconForType(String type) {
    switch (type) {
      case 'bank':
        return Icons.account_balance;
      case 'clinic':
        return Icons.local_hospital;
      case 'government':
        return Icons.account_balance;
      default:
        return Icons.event;
    }
  }

  Color getColorForType(String type) {
    switch (type) {
      case 'bank':
        return ColorManager.primary;
      case 'clinic':
        return Colors.green;
      case 'government':
        return ColorManager.accent;
      default:
        return Colors.purple;
    }
  }

  // ✅ دوال التنقل
  void goToHome() {
    final homeController = Get.find<HomeController>();
    homeController.goToHome();
  }

  void goToTicket() {
    final homeController = Get.find<HomeController>();
    homeController.goToTicket();
  }

  void goToProfile() {
    final homeController = Get.find<HomeController>();
    homeController.goToProfile();
  }
}
