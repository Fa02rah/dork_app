// import 'package:flutter/material.dart';

// class ColorManager {
//   // اللون الأزرق الرسمي الداكن
//   static const Color primary = Color(0xFF1A237E);
//   // اللون البرتقالي للتنبيهات والأزرار
//   static const Color accent = Color(0xFFF58220);
//   static const Color white = Color(0xFFFFFFFF);
//   static const Color grey = Color(0xFF757575);
//   static const Color black = Color(0xFF000000);
//   static const Color error = Color(0xFFE57373);
//   static const Color shadow = Color(0x1A000000);
//   static const Color primaryLight = Color(0xFFFFE0B2);
//   static const Color background = Color(0xFFF8FBFF);
//   // --- الإضافات الجديدة لصفحة الحجز ---

//   // 1. ألوان التدرج في الخلفية (Booking Background)
//   static const Color gradientStart = Color(0xFFE3F2FD); // أزرق فاتح جداً
//   static const Color gradientEnd = Color(0xFFFFFFFF);

//   // 2. ألوان كارد وقت الانتظار
//   static const Color waitCardBg = Color(0xFFFFF3E0); // برتقالي فاتح جداً للهلفية
//   static const Color waitCardBorder = Color(0xFFFFCC80); // لون الحدود للكارد

//   // 3. ألوان حالة الزحام (التي استخدمناها في الـ Gauge)
//   static const Color available = Color(0xFF4CAF50); // أخضر
//   static const Color busy = Color(0xFFFF9800);      // برتقالي
//   static const Color crowded = Color(0xFFF44336);   // أحمر

//   // 4. ألوان الأيقونات المزخرفة (القلب والزائد في الخلفية)
//   static Color decorativeIcon = const Color(0xFF2196F3).withOpacity(0.05);

//   // 5. لون النصوص الثانوية أو العناوين الصغيرة
//   static const Color textGrey = Color(0xFF9E9E9E);
//   static const Color bgGradientStart = Color(0xFFE3F2FD); // very light blue
//   static const Color bgGradientEnd = Color(0xFFFFFFFF);
//   static const Color cardCreamBg = Color(0xFFFBF4E4);
//   // --- إضافات اللمسات الجمالية لصفحة البنوك ---
//   static const Color cardShadowColor = Color(0x0F1A237E); // ظل ناعم جداً مائل للأزرق الداكن لمنع المظهر المتسخ
//   static const Color borderLight = Color(0x101A237E);     // إطار شفاف بنسبة 6% بلون الهوية الأزرق
//   static const Color textDark = Color(0xFF1A1A1A);        // لون نصوص داكن وفخم بديل للأسود الصريح
// }

import 'package:flutter/material.dart';

class ColorManager {
  // اللون الأزرق الرسمي الداكن
  static const Color primary = Color(0xFF1A237E);
  // اللون البرتقالي للتنبيهات والأزرار
  static const Color accent = Color(0xFFF58220);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF757575);
  static const Color black = Color(0xFF000000);
  static const Color error = Color(0xFFE57373);
  static const Color shadow = Color(0x1A000000);
  static const Color primaryLight = Color(0xFFFFE0B2);
  static const Color background = Color(0xFFF8FBFF);
  // --- الإضافات الجديدة لصفحة الحجز ---

  // 1. ألوان التدرج في الخلفية (Booking Background)
  static const Color gradientStart = Color(0xFFE3F2FD); // أزرق فاتح جداً
  static const Color gradientEnd = Color(0xFFFFFFFF);

  // 2. ألوان كارد وقت الانتظار
  static const Color waitCardBg = Color(
    0xFFFFF3E0,
  ); // برتقالي فاتح جداً للهلفية
  static const Color waitCardBorder = Color(0xFFFFCC80); // لون الحدود للكارد

  // 3. ألوان حالة الزحام (التي استخدمناها في الـ Gauge)
  static const Color available = Color(0xFF4CAF50); // أخضر
  static const Color busy = Color(0xFFFF9800); // برتقالي
  static const Color crowded = Color(0xFFF44336); // أحمر

  // 4. ألوان الأيقونات المزخرفة (القلب والزائد في الخلفية)
  static Color decorativeIcon = const Color(0xFF2196F3).withOpacity(0.05);

  // 5. لون النصوص الثانوية أو العناوين الصغيرة
  static const Color textGrey = Color(0xFF9E9E9E);
  static const Color bgGradientStart = Color(0xFFE3F2FD); // very light blue
  static const Color bgGradientEnd = Color(0xFFFFFFFF);
  static const Color cardCreamBg = Color(0xFFFBF4E4);
  // --- إضافات اللمسات الجمالية لصفحة البنوك ---
  static const Color cardShadowColor = Color(
    0x0F1A237E,
  ); // ظل ناعم جداً مائل للأزرق الداكن لمنع المظهر المتسخ
  static const Color borderLight = Color(
    0x101A237E,
  ); // إطار شفاف بنسبة 6% بلون الهوية الأزرق
  static const Color textDark = Color(0xFF1A1A1A);
  // لون نصوص داكن وفخم بديل للأسود الصريح
  static const Color amber = Color(0xFFFFC107);
}
