import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../provider_details/widgets/service_card.dart';
import '../controller/search_controller.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppSearchController controller = Get.find();

    return Obx(() => ListView.builder(
      itemCount: controller.filteredItems.length,
      itemBuilder: (context, index) {
        final item = controller.filteredItems[index];
          // عرض كرت الخدمة إذا كان النوع هو service
          return ServiceCard(
            title: item.title,
            description: item.description,
            imagePath: item.image,
            onTap: () => controller.onResultTap(item),
          );
        }

    ));
  }
}