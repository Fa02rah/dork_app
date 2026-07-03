// import 'package:get/get.dart';
// import '../../../../models/service_model.dart';

// class ServiceBookingController extends GetxController {
//   late ServiceModel service;

//   var providerName = "".obs;
//   var branchName = "".obs;
//   var providerLogo = "".obs; // سنستقبل هنا مسار صورة اللوغو (بنك، حكومي، إلخ)

//   var waitTime = "25 دقيقة".obs;
//   var waitingCount = 8.obs;
//   var crowdStatus = "مزدحم جزئياً".obs;
//   var crowdValue = 0.6.obs;

//   @override
//   void onInit() {
//     super.onInit();

//     if (Get.arguments != null && Get.arguments is Map) {
//       service = Get.arguments['service'];
//       providerName.value = Get.arguments['providerName'] ?? "مزود غير معروف";
//       branchName.value = Get.arguments['branchName'] ?? "الفرع الرئيسي";

//       // --- التعديل المطلوب هنا ---
//       // استخراج مسار اللوغو من الحقيبة المرسلة
//       providerLogo.value = Get.arguments['providerLogo'] ?? "";
//     } else if (Get.arguments is ServiceModel) {
//       service = Get.arguments;
//       providerName.value = "مزود افتراضي";
//     }
//   }

//   void confirmBooking() {
//     Get.snackbar(
//       "نجاح الحجز",
//       "تم تسجيل طلبك لخدمة ${service.title} في ${providerName.value} بنجاح",
//       snackPosition: SnackPosition.BOTTOM,
//       duration: const Duration(seconds: 3),
//     );
//   }
// }
// lib/views/home/service_booking/controller/service_booking_controller.dart

import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../models/service_model.dart';

class ServiceBookingController extends GetxController {
  // ✅ استخدم Rx<ServiceModel> عشان تكون Observable
  final service = ServiceModel(
    id: 1,
    title: 'استشارة طبية عامة',
    description:
        'فحص شامل مع طبيب مختص، يشمل قياس الضغط والسكر وتقييم الحالة الصحية العامة مع إعطاء النصائح الطبية المناسبة.',
    image: 'assets/images/clinic.png',
    providerId: 101,
  ).obs; // ✅ .obs عشان تكون متغير تفاعلي

  // بيانات أخرى
  var providerLogo = 'assets/images/clinic.png'.obs;
  var providerName = 'عيادة الأمل الطبية'.obs;
  var branchName = 'الفرع الرئيسي - بغداد'.obs;
  var waitTime = 15.obs;
  var waitingCount = 2.obs;
  var crowdStatus = 'متوسط'.obs;

  @override
  void onInit() {
    super.onInit();
    // أي تحميل إضافي إذا احتجت
  }

  void confirmBooking() {
    Get.snackbar(
      'تم الحجز',
      'تم حجز موعدك بنجاح!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.primary,
      colorText: ColorManager.white,
      duration: const Duration(seconds: 3),
    );
    // بعد الحجز نروح للصفحة الرئيسية
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed('/home');
    });
  }
}
