import 'package:get/get.dart';
import '../../../../models/service_model.dart';

class ServiceBookingController extends GetxController {
  late ServiceModel service;

  var providerName = "".obs;
  var branchName = "".obs;
  var providerLogo = "".obs; // سنستقبل هنا مسار صورة اللوغو (بنك، حكومي، إلخ)

  var waitTime = "25 دقيقة".obs;
  var waitingCount = 8.obs;
  var crowdStatus = "مزدحم جزئياً".obs;
  var crowdValue = 0.6.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments is Map) {
      service = Get.arguments['service'];
      providerName.value = Get.arguments['providerName'] ?? "مزود غير معروف";
      branchName.value = Get.arguments['branchName'] ?? "الفرع الرئيسي";

      // --- التعديل المطلوب هنا ---
      // استخراج مسار اللوغو من الحقيبة المرسلة
      providerLogo.value = Get.arguments['providerLogo'] ?? "";
    } else if (Get.arguments is ServiceModel) {
      service = Get.arguments;
      providerName.value = "مزود افتراضي";
    }
  }

  void confirmBooking() {
    Get.snackbar(
      "نجاح الحجز",
      "تم تسجيل طلبك لخدمة ${service.title} في ${providerName.value} بنجاح",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}