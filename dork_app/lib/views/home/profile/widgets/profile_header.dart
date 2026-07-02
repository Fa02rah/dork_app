import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          "الملف الشخصي",
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorManager.black.withOpacity(0.87), // استدعاء اللون من مدير الألوان
          ),
        ),
      ),
    );
  }
}