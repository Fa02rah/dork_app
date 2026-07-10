import 'package:dork_app/views/home/details/widgets/booking_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; // المكتبة الجديدة
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../../routes/app_routes.dart';
import 'controller/category_details_controller.dart';
import 'widgets/category_item_card.dart';

class CategoryDetailsView extends GetView<CategoryDetailsController> {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorManager.black.withOpacity(0.05)),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: ColorManager.black, size: 16),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: Text(
          controller.selectedCategory.name,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: ColorManager.textDark, // تم التعديل لاستخدام لون النص الداكن الموحد
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),

      body: ClipRRect(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: BookingBackground(
            child: Obx(() {
              // 1. حالة التحميل
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary),
                  ),
                );
              }

              // 2. حالة القائمة الفارغة
              if (controller.servicesList.isEmpty) {
                return const Center(
                  child: Text(
                    "لا توجد نتائج حالياً",
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 16,
                      color: ColorManager.grey,
                    ),
                  ),
                );
              }

              // 3. عرض القائمة مع تأثير الحركة
              return AnimationLimiter( // الغلاف الأساسي للمكتبة
                child: ListView.builder(
                  itemCount: controller.servicesList.length,
                  padding: const EdgeInsets.only(top: 120, bottom: 20),
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    final item = controller.servicesList[index];

                    // تطبيق تأثير الحركة على كل كرت
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 600),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CategoryItemCard(
                            title: item['name'] ?? '',
                            subtitle: item['desc'] ?? '',
                            imagePath: item['image'] ?? '',
                            rating: (item['rating'] as num?)?.toDouble() ?? 0.0,
                            onTap: () {
                              Get.toNamed(AppRoutes.PROVIDER_DETAILS, arguments: item);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}