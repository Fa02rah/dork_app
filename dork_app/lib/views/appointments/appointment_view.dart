// import 'package:dork_app/core/constants/color_manager.dart';
// import 'package:dork_app/core/theme/text_style.dart';
// import 'package:dork_app/views/appointments/widgets/appoinment_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller/appointments_controller.dart';
// import 'widgets/bottom_nav_appointments.dart';

// class AppointmentsView extends GetView<AppointmentsController> {
//   const AppointmentsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.background,
//       body: Column(
//         children: [
//           _buildHeader(),
//           Expanded(
//             child: Obx(() {
//               if (controller.isLoading.value) {
//                 return Center(
//                   child: CircularProgressIndicator(
//                     color: ColorManager.primary,
//                   ),
//                 );
//               }

//               if (controller.appointments.isEmpty) {
//                 return Center(
//                   child: Text(
//                     'لا توجد مواعيد',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: ColorManager.grey,
//                     ),
//                   ),
//                 );
//               }

//               return ListView.builder(
//                 padding: EdgeInsets.all(16),
//                 itemCount: controller.appointments.length,
//                 itemBuilder: (context, index) {
//                   return AppointmentCard(
//                     appointment: controller.appointments[index],
//                   );
//                 },
//               );
//             }),
//           ),
//           BottomNavAppointments(),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: ColorManager.white,
//         boxShadow: [
//           BoxShadow(
//             color: ColorManager.shadow,
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(  Icons.arrow_back,),

//             color: ColorManager.primary,
//             onPressed: () => Get.back(),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               'مواعيدي النشطة',
//               style: TextStyles.headLine.copyWith(
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Icon(
//             Icons.search,
//             color: ColorManager.primary,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/core/theme/text_style.dart';
import 'package:dork_app/views/appointments/widgets/appoinment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/appointments_controller.dart';
import '../home/controller/home_controller.dart';

class AppointmentsView extends StatelessWidget {
  // ✅ StatelessWidget
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ جلب الـ Controllers
    final AppointmentsController controller =
        Get.find<AppointmentsController>();
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                );
              }

              if (controller.appointments.isEmpty) {
                return Center(
                  child: Text(
                    'لا توجد مواعيد',
                    style: TextStyle(fontSize: 18, color: ColorManager.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.appointments.length,
                itemBuilder: (context, index) {
                  return AppointmentCard(
                    appointment: controller.appointments[index],
                  );
                },
              );
            }),
          ),
          _buildBottomNavigation(homeController),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: ColorManager.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'مواعيدي النشطة',
              style: TextStyles.headLine.copyWith(fontSize: 20),
            ),
          ),
          Icon(Icons.search, color: ColorManager.primary),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(HomeController homeController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border(
          top: BorderSide(color: ColorManager.grey.withOpacity(0.2)),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            label: 'الرئيسية',
            isSelected: false,
            onTap: () => homeController.goToHome(),
          ),
          _buildNavItem(
            icon: Icons.event,
            label: 'المواعيد',
            isSelected: true,
            onTap: () {},
          ), // أنت هنا),
          _buildNavItem(
            icon: Icons.confirmation_number,
            label: 'تذكرتي',
            isSelected: false,
            onTap: () => homeController.goToTicket(),
          ),
          _buildNavItem(
            icon: Icons.person,
            label: 'الملف',
            isSelected: false,
            onTap: () => homeController.goToProfile(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorManager.accent : ColorManager.grey,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? ColorManager.accent : ColorManager.grey,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
