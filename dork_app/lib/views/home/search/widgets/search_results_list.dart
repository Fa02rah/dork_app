import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../details/widgets/category_item_card.dart';
import '../controller/search_controller.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    // تأكد أن الكنترولر موجود في الذاكرة (عبر الـ Binding)
    final AppSearchController controller = Get.find();

    return Obx(() => ListView.builder(
      itemCount: controller.filteredItems.length,
      itemBuilder: (context, index) {
        final item = controller.filteredItems[index];
        return CategoryItemCard(
          title: item.title,
          subtitle: item.type,
          imagePath: item.image,
          onTap: () => controller.onResultTap(item),
        );
      },
    ));
  }
}