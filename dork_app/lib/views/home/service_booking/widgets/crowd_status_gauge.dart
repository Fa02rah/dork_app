import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';


class CrowdStatusGauge extends StatelessWidget {
  final String status;
  const CrowdStatusGauge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            "حالة الزحام:",
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // استخدام لون الزحام من الموديل
            Text(
                "مزدحم",
                style: TextStyle(color: ColorManager.crowded, fontSize: 12, fontFamily: 'Cairo')
            ),
            const SizedBox(width: 10),
            Container(
              width: 150,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    ColorManager.available, // أخضر
                    ColorManager.busy,      // برتقالي
                    ColorManager.crowded,   // أحمر
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            // استخدام لون المتاح من الموديل
            Text(
                "متاح",
                style: TextStyle(color: ColorManager.available, fontSize: 12, fontFamily: 'Cairo')
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
            status,
            style: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}