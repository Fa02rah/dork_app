import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../models/service_model.dart'; // استيراد الموديل الموحد
import '../../../../routes/app_routes.dart';

class AppSearchController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  // القائمة الآن تعتمد على ServiceModel مباشرة
  var allServices = <ServiceModel>[].obs;
  var filteredItems = <ServiceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    prepareServices();
  }

  void prepareServices() {
    // تعبئة البيانات باستخدام ServiceModel
    allServices.assignAll([
      ServiceModel(id: 1,
          title: "فتح حساب جديد",
          description: "حسابات توفير وجارية",
          image: ImageAssets.bank,
          providerId: 101),
      ServiceModel(id: 2,
          title: "بطاقة دفع",
          description: "استخراج بطاقات فيزا وماستر",
          image: ImageAssets.bank, providerId: 101),
      ServiceModel(id: 3, title: "استشارة مالية",
          description: "استشارة للأفراد والشركات",
          image: ImageAssets.bank, providerId: 101),
      ServiceModel(id: 4,
          title: "كشف طبي",
          description: "حجز موعد لدى طبيب مختص",
          image: ImageAssets.clinic, providerId: 201),
    ]);
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredItems.clear();
      return;
    }

    // البحث في الخدمات
    filteredItems.value = allServices.where((item) =>
    item.title.toLowerCase().contains(query.toLowerCase()) ||
        item.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // دالة الانتقال لصفحة الحجز
  void onResultTap(ServiceModel service) {
    // الانتقال مع تمرير كامل البيانات التي يحتاجها ServiceBookingController
    Get.toNamed(AppRoutes.SERVICE_BOOKING, arguments: {
      'service': service, // الكائن كاملاً
      'providerName': "الخدمة المطلوبة", // يمكنك هنا تحديد اسم المزود بناءً على الـ providerId إذا أردتِ
      'providerLogo': service.image,      // تمرير اللوجو مباشرة
      'branchName': "الفرع الرئيسي",
    });
  }

  @override
  void onClose() {
    searchTextController.dispose();
    super.onClose();
  }
}