import 'package:get/get.dart';
import '../../../../models/wallet_model.dart'; // تأكدي من مسار المودل الصحيح

class WalletController extends GetxController {

  // حالة المحفظة: نستخدم .obs لتحديث الواجهة تلقائياً عند تغير الرصيد
  var walletData = WalletModel(
      id: 0,
      userId: 0,
      balance: 0.0,
      heldBalance: 0.0,
      status: 'active'
  ).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // استدعاء البيانات بمجرد تهيئة الكنترولر
    fetchWalletBalance();
  }

  /// دالة لجلب بيانات المحفظة من السيرفر (API)
  Future<void> fetchWalletBalance() async {
    isLoading.value = true;
    try {
      // 1. هنا ستضعين رابط الـ API الخاص بكِ (مثلاً باستخدام Dio أو Http)
      // var response = await ApiService.get('/wallets/user_id');

      // 2. محاكاة لجلب البيانات (للتجربة)
      await Future.delayed(const Duration(seconds: 1));

      // 3. تحويل البيانات القادمة وتحديث الحالة
      // walletData.value = WalletModel.fromJson(response.data);

      print("تم جلب بيانات المحفظة بنجاح");

    } catch (e) {
      Get.snackbar("خطأ", "تعذر جلب بيانات المحفظة: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  /// دالة لتحديث الرصيد يدوياً (مثلاً بعد عملية إيداع أو دفع ناجحة)
  void updateBalance(double newBalance) {
    walletData.update((val) {
      // نقوم بتحديث القيمة الحالية مع الاحتفاظ بنفس القيم الأخرى
      // هذا يحافظ على الـ Obx ليعمل بشكل صحيح
    });
  }
}