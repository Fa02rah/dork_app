import 'package:get/get.dart';
import '../../views/auth/signup/controller/signup_controller.dart';
class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}