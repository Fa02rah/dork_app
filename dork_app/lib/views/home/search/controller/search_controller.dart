import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/search_item_model.dart';
import '../../../../routes/app_routes.dart';

class AppSearchController extends GetxController {
  final TextEditingController searchTextController = TextEditingController();

  // القائمة الأساسية لكل العناصر
  var allItems = <SearchItem>[].obs;
  // القائمة المفلترة التي ستظهر في الواجهة
  var filteredItems = <SearchItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // استدعاء دالة جلب البيانات عند بدء الكنترولر
    loadSearchData();
  }

  // 1. دالة جلب البيانات من قاعدة البيانات أو الـ API
  Future<void> loadSearchData() async {
    try {
      // ضعي هنا كود جلب البيانات من الـ Service الخاص بكِ
      // List<SearchItem> data = await MySearchService.fetchAllItems();

      // بمجرد جلب البيانات، قومي بتعبئتها في القائمة الأساسية
      // allItems.assignAll(data);

    } catch (e) {
      Get.snackbar("خطأ", "فشل تحميل بيانات البحث");
    }
  }

  // 2. دالة البحث التي تعمل عند الكتابة في مربع البحث[cite: 3]
  void search(String query) {
    if (query.isEmpty) {
      filteredItems.clear();
      return;
    }
    // البحث داخل القائمة الأساسية وتحديث النتائج
    filteredItems.value = allItems.where((item) =>
        item.title.toLowerCase().contains(query.toLowerCase())).toList();
  }

  // 3. دالة التنقل عند الضغط على نتيجة بحث
  void onResultTap(SearchItem item) {
    if (item.type == 'category') {
      Get.toNamed(AppRoutes.CATEGORY_DETAILS, arguments: {'categoryId': item.id});
    } else if (item.type == 'provider') {
      Get.toNamed(AppRoutes.PROVIDER_DETAILS, arguments: {'providerId': item.id});
    }
  }

  @override
  void onClose() {
    // تنظيف الذاكرة عند إغلاق الصفحة[cite: 3]
    searchTextController.dispose();
    super.onClose();
  }
}