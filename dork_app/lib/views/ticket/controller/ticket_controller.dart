// import 'package:dork_app/core/constants/color_manager.dart';
// import 'package:get/get.dart';

// class TicketController extends GetxController {
//   // بيانات التذكرة
//   var ticketNumber = 'A-14'.obs;
//   var currentTurn = 'A-12'.obs;
//   var peopleAhead = 2.obs;
//   var waitTime = 15.obs;
//   var clinicName = 'عيادة الأمل الطبية'.obs;
//   var doctorName = 'طبيب عيون'.obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadTicketData();
//   }

//   void loadTicketData() {
//     isLoading.value = true;
//     Future.delayed(Duration(seconds: 1), () {
//       isLoading.value = false;
//     });
//   }

//   void cancelTicket() {
//     Get.snackbar(
//       'تم الإلغاء',
//       'تم إلغاء تذكرتك بنجاح',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: ColorManager.error,
//       colorText: ColorManager.white,
//     );
//   }

//   void postponeTicket() {
//     Get.snackbar(
//       'تم التأجيل',
//       'تم تأجيل تذكرتك',
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: ColorManager.accent,
//       colorText: ColorManager.white,
//     );
//   }

//   void bookNewTicket() {
//     Get.toNamed('/book_ticket');
//   }

//   // Navigation
//   void goToHome() => Get.toNamed('/home');
//   void goToAppointments() => Get.toNamed('/appointments');
//   void goToProfile() => Get.toNamed('/profile');
// }
// lib/views/ticket/controller/ticket_controller.dart

import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../home/controller/home_controller.dart';

class TicketController extends GetxController {
  var ticketNumber = 'A-14'.obs;
  var currentTurn = 'A-12'.obs;
  var peopleAhead = 2.obs;
  var waitTime = 15.obs;
  var clinicName = 'عيادة الأمل الطبية'.obs;
  var doctorName = 'طبيب عيون'.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTicketData();
  }

  void loadTicketData() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }

  void cancelTicket() {
    Get.snackbar(
      'تم الإلغاء',
      'تم إلغاء تذكرتك بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.error,
      colorText: ColorManager.white,
    );
    // ✅ بعد الإلغاء نروح للرئيسية
    final homeController = Get.find<HomeController>();
    homeController.goToHome();
  }

  void postponeTicket() {
    Get.snackbar(
      'تم التأجيل',
      'تم تأجيل تذكرتك',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.accent,
      colorText: ColorManager.white,
    );
  }

  void bookNewTicket() {
    Get.toNamed('/service-booking');
  }

  // ✅ دوال التنقل
  void goToHome() {
    final homeController = Get.find<HomeController>();
    homeController.goToHome();
  }

  void goToAppointments() {
    final homeController = Get.find<HomeController>();
    homeController.goToAppointments();
  }

  void goToProfile() {
    final homeController = Get.find<HomeController>();
    homeController.goToProfile();
  }
}
