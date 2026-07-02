import 'package:dork_app/views/onboarding/widgets/illustration_widget.dart';
import 'package:dork_app/views/onboarding/widgets/page_indicator.dart';
import 'package:dork_app/views/onboarding/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboarding_controller/onboarding_controller.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/text_style.dart';
import '../../core/widgets shared/custom_button.dart';
class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // استخدمنا Stack لوضع زر التخطي فوق المحتوى الرئيسي
        child: Stack(
          children: [
            // الطبقة الأولى: المحتوى الرئيسي (Column)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // 1. الشعار العلوي
                  Center(child: Image.asset(ImageAssets.appLogo, height: 50)),

                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      itemCount: AppConstants.onboardingPages.length,
                      // ملاحظة: reverse: true تجعل السحب من اليسار لليمين (للعربية)
                      reverse: true,
                      itemBuilder: (context, index) {
                        final page = AppConstants.onboardingPages[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IllustrationWidget(imagePath: page.image),
                            const SizedBox(height: 50),
                            Text(
                              page.title,
                              style: TextStyles.headLine,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              page.description,
                              style: TextStyles.bodyText,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  // 2. مؤشر الصفحات
                  Obx(() => PageIndicatorWidget(
                    currentIndex: controller.currentPageIndex.value,
                    pageCount: AppConstants.onboardingPages.length,
                  )),

                  const SizedBox(height: 30),

                  // 3. الزر الموحد
                  Obx(() => CustomButton(
                    text: controller.currentPageIndex.value == AppConstants.onboardingPages.length - 1
                        ? 'ابدأ الآن'
                        : 'التالي',
                    onTap: () => controller.nextPage(),
                  )),

                  const SizedBox(height: 20),
                ],
              ),
            ),

            // الطبقة الثانية: زر التخطي (يظهر فوق المحتوى)
            const SkipButton(),
          ],
        ),
      ),
    );
  }
}