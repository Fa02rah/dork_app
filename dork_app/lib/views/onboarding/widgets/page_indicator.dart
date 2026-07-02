import 'package:flutter/material.dart';
import '../../../core/constants/color_manager.dart';
class PageIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  const PageIndicatorWidget({
    Key? key,
    required this.currentIndex,
    required this.pageCount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300), // مدة التحريك
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          // التغيير هنا: إذا كان الفهرس الحالي هو نفس رقم الدائرة، نجعلها أعرض
          width: currentIndex == index ? 25 : 10,
          decoration: BoxDecoration(
            // شكل دائري (سيتحول لشكل بيضاوي عند زيادة العرض)
            borderRadius: BorderRadius.circular(5),
            color: currentIndex == index
                ? ColorManager.accent // اللون الأزرق للنشط
                : ColorManager.grey.withOpacity(0.3), // الرمادي لغير النشط
          ),
        ),
      ),
    );
  }
}