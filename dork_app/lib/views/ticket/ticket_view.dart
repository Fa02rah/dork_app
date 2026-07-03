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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/color_manager.dart';
import '../../core/theme/text_style.dart';
import 'controller/ticket_controller.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketController controller = Get.find<TicketController>();

    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        backgroundColor: ColorManager.white, // ✅ نفس مواعيدي (أبيض)
        elevation: 0,
        title: Text(
          'تذكرتي',
          style: TextStyles.headLine.copyWith(
            fontSize: 20,
            color: ColorManager.primary, // ✅ نفس مواعيدي (أزرق غامق)
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.primary,
          ), // ✅ نفس مواعيدي
          onPressed: () => Get.offAllNamed('/home'),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.search, color: ColorManager.primary),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              Text('حجزك النشط', style: TextStyles.headLine),
              const SizedBox(height: 20),

              // ✅ بطاقة التذكرة
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.shadow,
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildInfoRow('رقم تذكرتك', controller.ticketNumber.value),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow('الدور الحالي', controller.currentTurn.value),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow(
                      '${controller.peopleAhead.value} أشخاص أمامك',
                      '',
                      isHighlight: true,
                    ),
                    const Divider(color: ColorManager.grey),
                    _buildInfoRow(
                      'الوقت المقدر للانتظار: ${controller.waitTime.value} دقيقة',
                      '',
                      isHighlight: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ✅ الأزرار (نفس مواعيدي)
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.postponeTicket,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.accent.withOpacity(0.15),
                        foregroundColor: ColorManager.accent,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'تأجيل',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.accent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.cancelTicket,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.error.withOpacity(0.15),
                        foregroundColor: ColorManager.error,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'إلغاء',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.error,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ✅ زر حجز جديد
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.bookNewTicket,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.accent,
                    foregroundColor: ColorManager.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'حجز جديد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isHighlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isHighlight ? ColorManager.primary : ColorManager.grey,
              fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isHighlight ? ColorManager.accent : ColorManager.primary,
              ),
            ),
        ],
      ),
    );
  }
}
