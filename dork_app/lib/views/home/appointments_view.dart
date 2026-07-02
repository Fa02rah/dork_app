import 'package:flutter/material.dart';
import '../../core/constants/color_manager.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_month_outlined, size: 80, color: ColorManager.primary.withOpacity(0.4)),
          const SizedBox(height: 15),
          const Text("لا توجد مواعيد نشطة", style: TextStyle(fontFamily: 'Cairo', fontSize: 16)),
        ],
      ),
    );
  }
}