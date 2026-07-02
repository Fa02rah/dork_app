import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color_manager.dart';
import '../controller/home_controller.dart';

class TopRatedServices extends StatelessWidget {
  const TopRatedServices({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "الخدمات الأكثر تقييماً",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
              color: ColorManager.primary,
            ),
          ),
        ),
        SizedBox(
          height: 160, // زيادة الارتفاع قليلاً ليعطي مساحة للظل الجديد
          child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10), // إزاحة للظل
            itemCount: controller.topRatedServices.length,
            itemBuilder: (context, index) {
              var service = controller.topRatedServices[index];
              return TopRatedCard(
                title: service.name,
                image: service.image,
                rating: 4.8,
              );
            },
          )),
        ),
      ],
    );
  }
}

class TopRatedCard extends StatelessWidget {
  final String title;
  final String image;
  final double rating;

  const TopRatedCard({
    super.key,
    required this.title,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // --- التعديل هنا: استخدام الظل البرتقالي المتناسق ---
            color: ColorManager.accent.withOpacity(0.25), // برتقالي فاتح جداً
            blurRadius: 15,
            offset: const Offset(0, 8),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 45,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.business, size: 40, color: ColorManager.grey),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                rating.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}