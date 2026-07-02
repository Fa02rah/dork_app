import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  // متغير رابط الصورة الشخصية قادم من الداتا بيز (يكون فارغاً في البداية)
  var userImageUrl = "".obs;

  var userName = "أحمد حسن الكيلاني".obs;
  var email = "ahmed.k@email.com".obs;
  var password = "123456789".obs;

  var upcomingBookings = 2.obs;
  var pastBookings = 12.obs;

  @override
  void onInit() {
    super.onInit();
    // هنا مستقبلاً عند استدعاء الداتا بيز نقوم بتحديث الرابط:
    // userImageUrl.value = response.data['profile_image'];
  }

  void logout() {
    Get.offAllNamed(AppRoutes.LOGIN);
    // منطق تسجيل الخروج
  }
}