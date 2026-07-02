import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/home_controller.dart';
import 'widgets/home_header.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/categories_grid.dart';
import 'widgets/top_rated_services.dart';
import '../../../core/constants/color_manager.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      // --- التعديل الجمالي الأول: التدرج اللوني خلف المحتوى ---
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.accent.withOpacity(0.06), // مسحة برتقالية خفيفة جداً في الأعلى
            ColorManager.background, // العودة للون الخلفية الرسمي للتطبيق
          ],
          stops: const [0.0, 0.25], // التدرج ينتهي عند أول 25% من الشاشة ليبقى التصميم نظيفاً
        ),
      ),
      child: RefreshIndicator(
        color: ColorManager.accent, // استخدام البرتقالي accent لدائرة التحميل
        onRefresh: () async => await controller.refreshData(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 15),

            // 1. الترويسة (اللوجو والترحيب)
            const HomeHeader(),

            const SizedBox(height: 25),

            // 2. شريط البحث
            const SearchBarWidget(),

            const SizedBox(height: 35),

            // 3. قسم الأصناف - تعديل اللون ليصبح Primary للفخامة
            const Text(
              "الأصناف",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
                color: ColorManager.primary, // الأزرق الداكن من ملف الألوان الخاص بكِ
              ),
            ),

            const SizedBox(height: 15),
            const CategoriesGrid(),

            const SizedBox(height: 35),

            // 4. الخدمات الأكثر تقييماً
            const TopRatedServices(),

            // مسافة أمان لضمان ظهور المحتوى كاملاً فوق الزر العائم
            const SizedBox(height: 140),
          ],
        ),
      ),
    );
  }
}