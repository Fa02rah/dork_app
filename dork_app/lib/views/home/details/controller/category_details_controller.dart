import 'package:dork_app/core/constants/image_assets.dart';
import 'package:get/get.dart';
import '../../../../models/category_model.dart';


class CategoryDetailsController extends GetxController {
  // 1. تعريف المتغيرات الأساسية
  late CategoryModel selectedCategory; // الصنف الذي تم الضغط عليه في الرئيسية
  var isLoading = true.obs;           // حالة التحميل (لإظهار مؤشر التحميل)
  var servicesList = <dynamic>[].obs; // قائمة الخدمات التي سيتم جلبها من الداتابيز

  @override
  void onInit() {
    super.onInit();
    // 2. استلام البيانات المرسلة من الصفحة الرئيسية
    if (Get.arguments != null) {
      updateCategory(Get.arguments as CategoryModel);      // 3. جلب البيانات بناءً على الصنف المختار
      fetchServicesByCategoryId();
    }
  }
  void updateCategory(CategoryModel category) {
    selectedCategory = category;
    fetchServicesByCategoryId(); // إعادة جلب البيانات بناءً على الصنف الجديد
  }

  // 4. دالة جلب البيانات (هنا نجهزها للربط مع API أو Database)
  void fetchServicesByCategoryId() async {
    try {
      isLoading(true);
      servicesList.clear();

      // محاكاة تأخير الشبكة (Network Delay)
      await Future.delayed(const Duration(seconds: 1));

      // ملاحظة: هنا سنقوم لاحقاً بكتابة كود الـ API
      // سنستخدم selectedCategory.id أو selectedCategory.categoryKey لفلترة البيانات

      // بيانات تجريبية (Mock Data) تظهر بناءً على النوع
      if (selectedCategory.name.contains("بنوك")) {
        servicesList.value = [
          {"name": "بنك الرافدين", "desc": "فرع المنصور - خدمات الأفراد",
            "image": ImageAssets.bank},
          {"name": "مصرف الرشيد", "desc": "فرع الكرادة - خدمات الشركات",
            "image": ImageAssets.bank},
          {"name": "بنك النهرين", "desc": "فرع حي الجامعة - تمويل عقاري",
            "image": ImageAssets.bank},
          {"name": "بنك الرافدين", "desc": "فرع المنصور - خدمات الأفراد",
            "image": ImageAssets.bank},
          {"name": "مصرف الرشيد", "desc": "فرع الكرادة - خدمات الشركات",
            "image": ImageAssets.bank},

        ];
      } else if (selectedCategory.name.contains("عيادات")) {
        servicesList.value = [
          {"name": "عيادة مجمع الشفاء", "desc": "أخصائي جراحة عامة",
            "image": ImageAssets.clinic},
          {"name": "مركز النور الطبي", "desc": "طب أسنان وتجميل",
            "image": ImageAssets.clinic},
        ];
      } else {
        // قائمة افتراضية لبقية الأصناف
        servicesList.value = [
          {"name": "خدمة تجريبية 1", "desc": "وصف الخدمة التابعة لـ ${selectedCategory.name}",
            "image": selectedCategory.image},
        ];
      }
    } catch (e) {
      Get.snackbar("خطأ", "حدث مشكلة أثناء جلب البيانات");
    } finally {
      isLoading(false);
    }
  }
}