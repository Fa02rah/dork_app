import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/color_manager.dart';
import '../controller/wallet_controller.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ربط الكنترولر لجلب البيانات
    final WalletController controller = Get.put(WalletController());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        // استخدام تدرج لوني خفيف من الهوية (الأزرق الداكن)
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorManager.borderLight),
        boxShadow: const [
          BoxShadow(
            color: ColorManager.cardShadowColor,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: ColorManager.primary),
          );
        }
        return Row(
          children: [
            // أيقونة المحفظة
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ColorManager.gradientStart,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.account_balance_wallet_rounded,
                  color: ColorManager.primary, size: 28),
            ),
            const SizedBox(width: 15),
            // بيانات الرصيد
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "رصيد المحفظة",
                  style: TextStyle(
                    color: ColorManager.textGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${controller.walletData.value.balance} د.ع",
                  style: const TextStyle(
                    color: ColorManager.textDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // زر صغير للإيداع أو التفاصيل
            Icon(Icons.arrow_forward_ios_rounded,
                size: 16, color: ColorManager.primary.withOpacity(0.5)),
          ],
        );
      }),
    );
  }
}