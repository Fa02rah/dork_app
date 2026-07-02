import 'package:dork_app/core/constants/image_assets.dart';
import 'package:get/get.dart';
import '../../../../models/service_model.dart';

class ProviderDetailsController extends GetxController {
  var providerName = ''.obs;
  var providerLogoPath = ''.obs; // اللوجو العلوي يبقى كما هو (ديناميكي)
  var services = <ServiceModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    // 1. استلام الاسم
    providerName.value = Get.arguments['name'] ?? 'تفاصيل الخدمة';

    // 2. منطق اللوجو العلوي (يبقى ديناميكي حسب نوع الجهة)
    if (providerName.value.contains("بنك") || providerName.value.contains("الرافدين")) {
      providerLogoPath.value = 'assets/images/bank.png';
    } else if (providerName.value.contains("صحة") || providerName.value.contains("حكومي")) {
      providerLogoPath.value = 'assets/images/gov.png';
    } else {
      providerLogoPath.value = Get.arguments['image'] ?? 'assets/images/fun.png';
    }

    fetchServices(Get.arguments['id'] ?? 0);
  }

  void fetchServices(int providerId) async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(milliseconds: 800));

      if (providerName.value.contains("بنك")) {
        services.assignAll([
          // تم حذف مسار الصورة هنا
          ServiceModel(
              id: 1,
              title: "فتح حساب جديد",
              description: "حسابات توفير وجارية",
              image: ImageAssets.bank, // نتركها فارغة أو نحذفها حسب الـ Model لديك
              providerId: providerId
          ),
          ServiceModel(
              id: 2,
              title: "بطاقة دفع",
              description: "استخراج بطاقات فيزا وماستر",
              image: ImageAssets.bank,
              providerId: providerId
          ),
    ServiceModel(
    id: 3,
    title: "استشارة مالية ",
    description: "استشارة مالية للافراد والشركات ",
    image: ImageAssets.bank,
    providerId: providerId
        ),
          ServiceModel(
              id: 4,
              title: "خدمات التمويل  ",
              description: "خدمات التمويل للافراد والشركات  ",
              image: ImageAssets.bank,
              providerId: providerId
          ),
          ServiceModel(
              id: 5,
              title: "خدمات التمويل  ",
              description: "خدمات التمويل للافراد والشركات  ",
              image: ImageAssets.bank,
              providerId: providerId
          ),
        ]);
      } else {
        services.assignAll([
          // تم حذف مسار الصورة هنا
          ServiceModel(
              id: 3,
              title: "كشف طبي",
              description: "حجز موعد لدى طبيب مختص",
              image: ImageAssets.clinic,
              providerId: providerId
          ),
          ServiceModel(
              id: 4,
              title: "استشارة",
              description: "استشارة فورية عبر التطبيق",
              image: ImageAssets.clinic,
              providerId: providerId
          ),
        ]);
      }
    } finally {
      isLoading(false);
    }
  }
}