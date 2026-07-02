import 'package:get/get.dart';
import '../../views/auth/login/controller/login_controller.dart';

// هذا الكلاس وظيفته فقط "حقن" الكنترولر في الذاكرة
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // نستخدم lazyPut لكي لا يتم إنشاء الكنترولر إلا عند الحاجة إليه (عند فتح الصفحة)
    Get.lazyPut<LoginController>(() => LoginController());
  }
}