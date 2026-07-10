// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants/color_manager.dart';
// import '../../../core/theme/text_style.dart';
// import '../controller/appointments_controller.dart';

// class AppoinmentCard extends GetView<AppointmentsController> {
//   final Map<String, dynamic> appointment;

//   const AppoinmentCard({super.key, required this.appointment});

//   @override
//   Widget build(BuildContext context) {
//     final icon = controller.getIconForType(appointment['type']);
//     final color = controller.getColorForType(appointment['type']);
//     final isCompleted = appointment['status'] == 'completed';

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: ColorManager.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: ColorManager.shadow,
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // النوع والاسم والحالة
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: color.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(icon, color: color, size: 24),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         appointment['typeName'],
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: ColorManager.grey,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       Text(
//                         appointment['name'],
//                         style: TextStyles.bodyText.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: ColorManager.black,
//                         ),
//                       ),
//                       Text(
//                         appointment['location'],
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: ColorManager.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: isCompleted
//                         ? Colors.green.withOpacity(0.15)
//                         : ColorManager.accent.withOpacity(0.15),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     appointment['statusText'],
//                     style: TextStyle(
//                       color: isCompleted ? Colors.green : ColorManager.accent,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             const Divider(color: ColorManager.grey),
//             const SizedBox(height: 12),
//             // تفاصيل التذكرة
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'التذكرة: ${appointment['ticket']}',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: ColorManager.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'الوقت: ${appointment['time']}',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: ColorManager.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   appointment['date'],
//                   style: TextStyle(fontSize: 13, color: ColorManager.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/theme/text_style.dart';
import '../controller/appointments_controller.dart';

class AppoinmentCard extends StatelessWidget {
  // ✅ StatelessWidget
  final Map<String, dynamic> appointment;

  const AppoinmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final AppointmentsController controller = Get.find();
    final icon = controller.getIconForType(appointment['type']);
    final color = controller.getColorForType(appointment['type']);
    final isCompleted = appointment['status'] == 'completed';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointment['typeName'],
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorManager.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        appointment['name'],
                        style: TextStyles.bodyText.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      Text(
                        appointment['location'],
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorManager.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.green.withOpacity(0.15)
                        : ColorManager.accent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    appointment['statusText'],
                    style: TextStyle(
                      color: isCompleted ? Colors.green : ColorManager.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: ColorManager.grey),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'التذكرة: ${appointment['ticket']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'الوقت: ${appointment['time']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorManager.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  appointment['date'],
                  style: TextStyle(fontSize: 13, color: ColorManager.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
