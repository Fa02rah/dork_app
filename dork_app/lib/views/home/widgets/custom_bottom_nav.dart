// import 'package:flutter/material.dart';
// import '../../../core/constants/color_manager.dart';

// class CustomBottomNav extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;

//   const CustomBottomNav({
//     super.key,
//     required this.currentIndex,
//     required this.onTap
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // إضافة الظل العلوي لإعطاء عمق (Depth) للشريط
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             color: ColorManager.shadow, // الـ Shadow من ملف الألوان الخاص بكِ
//             blurRadius: 20,
//             offset: Offset(0, -5),
//           ),
//         ],
//       ),
//       child: BottomAppBar(
//         // الخصائص لعمل الفتحة حول الزر العائم FAB
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10.0, // زيادة الفراغ قليلاً لجمالية أكبر
//         color: ColorManager.white,
//         elevation: 0, // لغينا الـ elevation لأننا استخدمنا الـ Container Shadow
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.transparent, // لجعل خلفية الـ BottomAppBar تظهر
//           elevation: 0,
//           currentIndex: currentIndex,
//           onTap: onTap,

//           // التعديل اللوني المهم: البرتقالي للنشط والرمادي لغير النشط
//           selectedItemColor: ColorManager.accent,
//           unselectedItemColor: ColorManager.grey.withOpacity(0.6),

//           selectedLabelStyle: const TextStyle(
//               fontFamily: 'Cairo',
//               fontSize: 12,
//               fontWeight: FontWeight.bold
//           ),
//           unselectedLabelStyle: const TextStyle(
//               fontFamily: 'Cairo',
//               fontSize: 12
//           ),

//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home_filled),
//                 label: 'الرئيسية'
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.calendar_month),
//                 label: 'المواعيد'
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications),
//                 label: 'الإشعارات'
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'الملف'
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/views/home/widgets/custom_bottom_nav.dart

import 'package:flutter/material.dart';
import '../../../core/constants/color_manager.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorManager.shadow,
            blurRadius: 20,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: ColorManager.white,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: ColorManager.accent,
          unselectedItemColor: ColorManager.grey.withOpacity(0.6),
          selectedLabelStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 12,
          ),
          // ✅ تحديث قائمة الأيقونات
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'المواعيد',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), // ✅ أيقونة التذكرة
              label: 'تذكرتي', // ✅ بدل الإشعارات
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
          ],
        ),
      ),
    );
  }
}
