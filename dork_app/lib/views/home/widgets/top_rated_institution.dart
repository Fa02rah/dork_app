import 'package:dork_app/views/home/widgets/top_rated_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../../../routes/app_routes.dart';
import '../controller/home_controller.dart';

class TopRatedInstitution extends StatelessWidget {
  const TopRatedInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "المؤسسات الأكثر تقييماً",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: ColorManager.primary,
            ),
          ),
        ),
        SizedBox(
          height: 160,
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: controller.topRatedInstituation.length,
            itemBuilder: (context, index) {
              var service = controller.topRatedInstituation[index];
              return TopRatedCard(
                title: service.name,
                image: service.image,
                rating: 4.8,
                onTap: () {
                  Get.toNamed(AppRoutes.PROVIDER_DETAILS, arguments: {
                    'id': service.id,
                    'name': service.name,
                    'image': service.image,
                    'rating': 4.8,
                  });
                },
              );
            },
          )),
        ),
      ],
    );
  }
}