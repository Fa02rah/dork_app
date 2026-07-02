
import '../../models/onboarding_model.dart';
import 'image_assets.dart';

class AppConstants {
  static List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: 'اكتشف الخدمات القريبة',
      description: 'ابحث عن العيادات، الدوائر الحكومية، والمراكز الخدمية القريبة منك بسهولة.',
      image: ImageAssets.onboarding1,
       // تجعل العرض يأخذ أقصى مساحة ممكنة
    ),
    OnboardingModel(
      title: 'احجز دورك عن بعد',
      description: 'اختر الخدمة، الوقت المناسب، واحصل على تذكرتك الرقمية فوراً دون عناء الانتظار.',
      image: ImageAssets.onboarding2,
    ),
    OnboardingModel(
      title: 'إشعارات ذكية بالموعد',
      description: 'سننبهك قبل اقتراب دورك بوقت كافٍ لتتمكن من استغلال وقتك بحرية.',
      image: ImageAssets.onboarding3,
    ),
  ];}