import 'package:flutter/material.dart';

import '../constants/color_manager.dart';

class TextStyles {
  // نمط العناوين الرئيسية الكبيرة
  static const TextStyle headLine = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: ColorManager.black,
    height: 1.5,
  );

  // نمط النصوص الوصفية الصغيرة
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: ColorManager.grey,
    height: 1.5,
  );

  // نمط نص الزر
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorManager.white,
  );
}