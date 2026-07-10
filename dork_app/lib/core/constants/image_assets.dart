class ImageAssets {
  // 1. مسار المجلد الرئيسي
  static const String _basePath = 'assets/images';

  // 2. الهوية البصرية
  static const String appLogo = '$_basePath/dork_logo.png';

  // 3. صور الـ Onboarding
  static const String onboarding1 = '$_basePath/onboardingone.PNG';
  static const String onboarding2 = '$_basePath/onboardingtwo.PNG';
  static const String onboarding3 = '$_basePath/onboardingthree.PNG';

  // --- الإضافات الجديدة للواجهة الرئيسية ---

  // 4. أيقونات الأصناف (Categories)
  // تأكد من وجود هذه الملفات في مجلد assets/images بنفس الأسماء
  static const String bank = '$_basePath/bank.png';
  static const String logo = '$_basePath/dork_logo.png';
  static const String gov = '$_basePath/gov.png';
  static const String clinic = '$_basePath/clinic.png';
  static const String edu = '$_basePath/edu.png';
  static const String food = '$_basePath/food.png';
  static const String fun = '$_basePath/fun.png';

  // 5. أيقونات الخدمات الأكثر تقييماً (Top Rated)
  static const String bankLogo = '$_basePath/bank.png';
  static const String clinicLogo = '$_basePath/clinic.png';

  // 6. صور الحالات (States)
  static const String noData =
      '$_basePath/no_data.png'; // تظهر عند فراغ القائمة
  static const String offline =
      '$_basePath/offline.png'; // تظهر عند انقطاع الانترنت
}
