// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../appointments_view.dart';
// import '../main_home_view.dart';
// import '../../../models/category_model.dart';
// import '../../../core/constants/image_assets.dart';
// import '../profile/profile_view.dart';

// class HomeController extends GetxController {
//   final TextEditingController searchController = TextEditingController();

//   var categories = <CategoryModel>[].obs;
//   var foundCategories = <CategoryModel>[].obs;
//   var isLoading = true.obs;
//   var currentPage = 0.obs;
//   var topRatedServices = <CategoryModel>[].obs;

//   final List<Widget> pages = [
//     const MainHomeView(),
//     const AppointmentsView(),
//     const Center(child: Text("صفحة الإشعارات")),
//     const ProfileView(),
//   ];

//   @override
//   void onInit() {
//     refreshData();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }

//   Future<void> refreshData() async {
//     await fetchCategories();
//     await fetchTopRatedServices();
//   }

//   Future<void> fetchCategories() async {
//     try {
//       isLoading(true);
//       await Future.delayed(const Duration(seconds: 1));

//       // --- التعديل هنا: إضافة الـ categoryKey لكل صنف ---
//       var serverResponse = [
//         CategoryModel(id: 1, name: "بنوك", image: ImageAssets.bank, categoryKey: 'banks'),
//         CategoryModel(id: 2, name: "حكومي", image: ImageAssets.gov, categoryKey: 'government'),
//         CategoryModel(id: 3, name: "عيادات", image: ImageAssets.clinic, categoryKey: 'clinics'),
//         CategoryModel(id: 4, name: "تعليم", image: ImageAssets.edu, categoryKey: 'education'),
//         CategoryModel(id: 5, name: "مطاعم", image: ImageAssets.food, categoryKey: 'restaurants'),
//         CategoryModel(id: 6, name: "ترفيه", image: ImageAssets.fun, categoryKey: 'entertainment'),
//       ];

//       categories.assignAll(serverResponse);
//       foundCategories.assignAll(serverResponse);
//     } finally {
//       isLoading(false);
//     }
//   }

//   void filterCategories(String categoryName) {
//     List<CategoryModel> results = [];
//     if (categoryName.isEmpty) {
//       results = categories;
//     } else {
//       results = categories
//           .where((element) =>
//           element.name.toLowerCase().contains(categoryName.toLowerCase()))
//           .toList();
//     }
//     foundCategories.assignAll(results);
//   }

//   Future<void> fetchTopRatedServices() async {
//     // تم إضافة categoryKey هنا أيضاً لتجنب أي أخطاء في الـ Model
//     var topRatedResponse = [
//       CategoryModel(id: 101, name: "بنك الرافدين", image: ImageAssets.bank, categoryKey: 'banks'),
//       CategoryModel(id: 102, name: "مشفى الأمل", image: ImageAssets.clinic, categoryKey: 'clinics'),
//       CategoryModel(id: 103, name: "المصرف الإسلامي", image: ImageAssets.bank, categoryKey: 'banks'),
//     ];
//     topRatedServices.assignAll(topRatedResponse);
//   }

//   void changePage(int index) {
//     currentPage.value = index;
//   }
// }

// lib/views/home/controller/home_controller.dart

import 'package:dork_app/views/appointments/appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../appointments_view.dart';
import '../main_home_view.dart';
import '../../../models/category_model.dart';
import '../../../core/constants/image_assets.dart';
import '../profile/profile_view.dart';
import '../../ticket/ticket_view.dart';
import '../../ticket/controller/ticket_controller.dart'; // ✅ استيراد TicketController
import '../../appointments/controller/appointments_controller.dart'; // ✅ استيراد AppointmentsController

class HomeController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  var categories = <CategoryModel>[].obs;
  var foundCategories = <CategoryModel>[].obs;
  var isLoading = true.obs;
  var currentPage = 0.obs;
  var topRatedServices = <CategoryModel>[].obs;

  // ✅ تسجيل الـ Controllers هنا
  late final TicketController ticketController;
  late final AppointmentsController appointmentsController;

  // ✅ قائمة الصفحات
  late final List<Widget> pages;

  @override
  void onInit() {
    super.onInit();

    // ✅ تسجيل الـ Controllers
    ticketController = Get.put(TicketController(), permanent: false);
    appointmentsController = Get.put(
      AppointmentsController(),
      permanent: false,
    );

    // ✅ تهيئة الصفحات بعد تسجيل الـ Controllers
    pages = [
      const MainHomeView(), // 0: الرئيسية
      const AppointmentView(), // 1: المواعيد
      const TicketView(),
      const Center(child: Text("صفحة الاشعارات")), // 2: تذكرتي
      const ProfileView(), // 3: الملف
    ];

    refreshData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  Future<void> refreshData() async {
    await fetchCategories();
    await fetchTopRatedServices();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1));

      var serverResponse = [
        CategoryModel(
          id: 1,
          name: "بنوك",
          image: ImageAssets.bank,
          categoryKey: 'banks',
        ),
        CategoryModel(
          id: 2,
          name: "حكومي",
          image: ImageAssets.gov,
          categoryKey: 'government',
        ),
        CategoryModel(
          id: 3,
          name: "عيادات",
          image: ImageAssets.clinic,
          categoryKey: 'clinics',
        ),
        CategoryModel(
          id: 4,
          name: "تعليم",
          image: ImageAssets.edu,
          categoryKey: 'education',
        ),
        CategoryModel(
          id: 5,
          name: "مطاعم",
          image: ImageAssets.food,
          categoryKey: 'restaurants',
        ),
        CategoryModel(
          id: 6,
          name: "ترفيه",
          image: ImageAssets.fun,
          categoryKey: 'entertainment',
        ),
      ];

      categories.assignAll(serverResponse);
      foundCategories.assignAll(serverResponse);
    } finally {
      isLoading(false);
    }
  }

  void filterCategories(String categoryName) {
    List<CategoryModel> results = [];
    if (categoryName.isEmpty) {
      results = categories;
    } else {
      results = categories
          .where(
            (element) =>
                element.name.toLowerCase().contains(categoryName.toLowerCase()),
          )
          .toList();
    }
    foundCategories.assignAll(results);
  }

  Future<void> fetchTopRatedServices() async {
    var topRatedResponse = [
      CategoryModel(
        id: 101,
        name: "بنك الرافدين",
        image: ImageAssets.bank,
        categoryKey: 'banks',
      ),
      CategoryModel(
        id: 102,
        name: "مشفى الأمل",
        image: ImageAssets.clinic,
        categoryKey: 'clinics',
      ),
      CategoryModel(
        id: 103,
        name: "المصرف الإسلامي",
        image: ImageAssets.bank,
        categoryKey: 'banks',
      ),
    ];
    topRatedServices.assignAll(topRatedResponse);
  }

  void changePage(int index) {
    currentPage.value = index;
  }

  // ✅ دوال التنقل
  void goToHome() {
    currentPage.value = 0;
  }

  void goToAppointments() {
    currentPage.value = 1;
  }

  void goToTicket() {
    currentPage.value = 2;
  }

  void goToProfile() {
    currentPage.value = 3;
  }
}
