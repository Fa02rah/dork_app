import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart'; // تأكدي من مسار الاستيراد
import 'controller/search_controller.dart';
import 'widgets/search_input_widget.dart';
import 'widgets/search_results_list.dart';
import '../details/widgets/booking_background.dart'; // استيراد ملف الخلفية

class SearchView extends GetView<AppSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // جعل خلفية الـ Scaffold شفافة لتظهر الخلفية المخصصة
      backgroundColor: Colors.transparent,
      body: BookingBackground(
        child: Column(
          children: [
            // مسافة علوية لتجنب التداخل مع شريط الحالة (Status Bar)
            const SizedBox(height: 50),

            // "AppBar" مخصص ليناسب التصميم الانسيابي للخلفية
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: ColorManager.black),
                    onPressed: () => Get.back(),
                  ),
                  const Text(
                      "البحث",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorManager.black)
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10), // مسافة بسيطة قبل حقل البحث

            // حقل البحث
            SearchInputWidget(
              controller: controller.searchTextController,
              onChanged: (val) => controller.search(val),
            ),

            // قائمة النتائج
            const Expanded(
              child: SearchResultsList(),
            ),
          ],
        ),
      ),
    );
  }
}