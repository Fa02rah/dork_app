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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color_manager.dart';
import '../../core/theme/text_style.dart';
import 'controller/appointments_controller.dart';
import 'widgets/appoinment_card.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentsController controller =
        Get.find<AppointmentsController>();

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: Text(
          'مواعيدي النشطة',
          style: TextStyles.headLine.copyWith(
            fontSize: 20,
            color: ColorManager.primary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorManager.primary),
          onPressed: () => Get.offAllNamed('/home'),
        ),
        actions: [
          // IconButton(
          // icon: Icon(Icons.search, color: ColorManager.primary),
          // onPressed: () {},
          // ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        }

        if (controller.appointments.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.event_busy,
                  size: 80,
                  color: ColorManager.grey.withOpacity(0.4),
                ),
                const SizedBox(height: 16),
                Text(
                  'لا توجد مواعيد',
                  style: TextStyle(fontSize: 18, color: ColorManager.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) {
            return AppoinmentCard(appointment: controller.appointments[index]);
          },
        );
      }),
    );
  }
}
