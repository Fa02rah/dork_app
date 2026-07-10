import 'dart:ui';
import 'package:dork_app/views/home/provider_details/widgets/rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../../routes/app_routes.dart';
import '../details/widgets/booking_background.dart';
import 'controller/provider_details_controller.dart';
import 'widgets/service_card.dart';

class ProviderDetailsView extends GetView<ProviderDetailsController> {
  const ProviderDetailsView({super.key});
  void _showRatingDialog(BuildContext context) {
    Get.dialog(
      RatingDialog(
        onRatingSubmitted: (rating) {
          controller.submitRating(rating); // نرسل القيمة للكنترولر
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // استقبال البيانات المرسلة من الصفحة السابقة
    final Map<String, dynamic> providerInfo = Get.arguments ?? {};
    final String providerName = providerInfo['name'] ?? controller.providerName.value;
    final String providerLogo = providerInfo['image'] ?? controller.providerLogoPath.value;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          providerName,
          // إزالة const هنا لتجنب أي تعارض في الستايل
          style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              color: ColorManager.textDark
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.star_border_rounded, color: ColorManager.amber, size: 35),
              onPressed: () => _showRatingDialog(context),
            ),
          ),
        ],
      ),
      body: BookingBackground(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          }

          return AnimationLimiter(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 130, bottom: 20),
              itemCount: controller.services.length,
              itemBuilder: (context, index) {
                // الوصول للبيانات ككائن ServiceModel كما هو في الكنترولر
                final serviceItem = controller.services[index];

                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 600),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ServiceCard(
                        // استخدام خصائص الـ ServiceModel مباشرة
                        title: serviceItem.title,
                        description: serviceItem.description,
                        imagePath: serviceItem.image ?? '',
                        onTap: () {
                          Get.toNamed(AppRoutes.SERVICE_BOOKING, arguments: {
                            'service': serviceItem,
                            'providerName': providerName,
                            'providerLogo': providerLogo,
                          });
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
    );
  }
}