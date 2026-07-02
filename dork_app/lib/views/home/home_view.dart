// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/color_manager.dart';
// import 'controller/home_controller.dart';
// import 'widgets/custom_bottom_nav.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // حقن الكنترولر في الذاكرة (سيبقى يعمل طوال فترة تواجد المستخدم في هذه الشاشات)
//     final HomeController controller = Get.put(HomeController());
//     return Scaffold(
//       backgroundColor: ColorManager.background,
//       // الزر العائم سيبقى ظاهراً في جميع الصفحات (الرئيسية، المواعيد، إلخ)
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {

//         },
//         backgroundColor: ColorManager.accent,
//         shape: const CircleBorder(),
//         elevation: 6,
//         child: const Icon(Icons.add, color: Colors.white, size: 35),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

//       // شريط التنقل السفلي المخصص مرتبط بالـ Obx لتغيير الأيقونة النشطة فوراً
//       bottomNavigationBar: Obx(() => CustomBottomNav(
//         currentIndex: controller.currentPage.value, // القيمة تأتي ديناميكياً من الكنترولر
//         onTap: (index) {
//           controller.changePage(index); // تحديث الصفحة عند الضغط
//         },
//       )),

//       body: SafeArea(
//         child: Obx(() {
//           // 1. عرض دائرة التحميل في حالة جلب البيانات لأول مرة
//           if (controller.isLoading.value) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: ColorManager.accent,
//                 strokeWidth: 3,
//               ),
//             );
//           }

//           // 2. التغيير الديناميكي: عرض الصفحة المطلوبة من قائمة الـ pages الملعنة في الكنترولر
//           // إذا كان index = 0 سيعرض ملف MainHomeView الذي يحتوي على الهيدر والبحث والأصناف
//           // إذا كان index = 1 سيعرض ملف AppointmentsView (مواعيدي)
//           return controller.pages[controller.currentPage.value];
//         }),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'widgets/custom_bottom_nav.dart';
import '../../../core/constants/color_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorManager.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/service-booking');
        },
        backgroundColor: ColorManager.accent,
        shape: const CircleBorder(),
        elevation: 6,
        child: const Icon(Icons.add, color: Colors.white, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => CustomBottomNav(
          currentIndex: controller.currentPage.value,
          onTap: (index) {
            controller.changePage(index);
          },
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorManager.accent,
                strokeWidth: 3,
              ),
            );
          }
          // ✅ عرض الصفحة حسب الفهرس
          return controller.pages[controller.currentPage.value];
        }),
      ),
    );
  }
}
