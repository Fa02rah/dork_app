// import 'package:dork_app/core/constants/color_manager.dart';
// import 'package:dork_app/core/theme/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller/ticket_controller.dart';
// import 'widgets/ticket_info_widget.dart';
// import 'widgets/ticket_buttons_widget.dart';
// import 'widgets/bottom_nav_ticket.dart';

// class TicketView extends GetView<TicketController> {
//   const TicketView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.background,
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: ColorManager.primary,
//             ),
//           );
//         }

//         return Column(
//           children: [
//             _buildHeader(),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'حجزك النشط',
//                       style: TextStyles.headLine,
//                     ),
//                     SizedBox(height: 20),
//                     TicketInfoWidget(),
//                     Spacer(),
//                     TicketButtonsWidget(),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//             BottomNavTicket(),
//           ],
//         );
//       }),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             ColorManager.primary,
//             ColorManager.primary.withOpacity(0.8),
//           ],
//         ),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: ColorManager.white,
//             child: Icon(
//               Icons.person,
//               color: ColorManager.primary,
//             ),
//           ),
//           SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               'مرحباً بك',
//               style: TextStyle(
//                 color: ColorManager.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Icon(
//             Icons.notifications_outlined,
//             color: ColorManager.white,
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/views/ticket/ticket_view.dart

import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/ticket_controller.dart';
import 'widgets/ticket_info_widget.dart';
import 'widgets/ticket_buttons_widget.dart';
import '../home/controller/home_controller.dart';

class TicketView extends StatelessWidget {
  // ✅ StatelessWidget بدل GetView
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ جلب الـ Controller
    final TicketController controller = Get.find<TicketController>();
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        }

        return Column(
          children: [
            _buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('حجزك النشط', style: TextStyles.headLine),
                    const SizedBox(height: 20),
                    TicketInfoWidget(),
                    const Spacer(),
                    TicketButtonsWidget(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildBottomNavigation(homeController),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorManager.primary, ColorManager.primary.withOpacity(0.8)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              'مرحباً بك',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(Icons.notifications_outlined, color: Colors.white),
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
            isSelected: false,
            onTap: () => homeController.goToAppointments(),
          ),
          _buildNavItem(
            icon: Icons.confirmation_number,
            label: 'تذكرتي',
            isSelected: true,
            onTap: () {}, // أنت هنا
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
