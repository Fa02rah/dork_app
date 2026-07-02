import 'package:dork_app/routes/app_pages.dart';
import 'package:dork_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/color_manager.dart';

// تعريف المتغيرات لمعرفة حالة المستخدم
bool isFirstTimeUser = true;
bool isLoggedIn = false; // المتغير الجديد لحالة تسجيل الدخول

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialConfig();

  runApp(const DorkApp());
}

Future<void> initialConfig() async {
  print("جاري تشغيل محرك دورك...");

  final prefs = await SharedPreferences.getInstance();

  // 1. قراءة حالة المستخدم الجديد (Onboarding)
  isFirstTimeUser = prefs.getBool('isFirstTime') ?? true;

  // 2. قراءة حالة تسجيل الدخول (Login Status)
  isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
}

class DorkApp extends StatelessWidget {
  const DorkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dork - دورك',
      locale: const Locale('ar', 'SA'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: ColorManager.primary,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // 3. التعديل المنطقي للمسار الابتدائي:
      // أولاً: نتحقق إذا كان المستخدم جديداً نرسله للـ Onboarding.
      // ثانياً: إذا لم يكن جديداً، نتحقق هل سجل دخوله سابقاً؟
      // - إذا نعم: نرسله للـ HOME مباشرة.
      // - إذا لا: نرسله للـ LOGIN.
      initialRoute: isFirstTimeUser
          ? AppRoutes.onboarding
          : (isLoggedIn ? AppRoutes.HOME : AppRoutes.LOGIN),

      getPages: AppPages.pages,
    );
  }
}