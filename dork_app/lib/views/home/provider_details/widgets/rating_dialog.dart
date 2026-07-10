import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';

class RatingDialog extends StatelessWidget {
  final Function(double) onRatingSubmitted;

  const RatingDialog({super.key, required this.onRatingSubmitted});

  @override
  Widget build(BuildContext context) {
    double tempRating = 0.0;

    return AlertDialog(
      title: const Text("قيّم المؤسسة", style: TextStyle(fontFamily: 'Cairo')),
      content: RatingBar.builder(
        initialRating: 0,
        minRating: 1,
        itemCount: 5,
        itemSize: 35.0,
        itemBuilder: (context, _) =>
            const Icon(Icons.star, color: ColorManager.amber),
        onRatingUpdate: (rating) => tempRating = rating,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            "إلغاء",
            style: TextStyle(color: ColorManager.grey),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: ColorManager.accent),
          onPressed: () {
            onRatingSubmitted(tempRating);
            Get.back();
          },
          child: const Text(
            "إرسال",
            style: TextStyle(color: ColorManager.white),
          ),
        ),
      ],
    );
  }
}
