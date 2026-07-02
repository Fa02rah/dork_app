import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // استيراد مكتبة التقاط الصور
import '../../../../../core/constants/color_manager.dart'; // ثوابت الألوان لمشروعكِ
import '../../controller/profile_controller.dart';

class EditProfileController extends GetxController {
  // جلب نسخة الكنترولر الأساسي لقراءة البيانات وتحديثها
  final ProfileController _profileController = Get.find<ProfileController>();

  // نسخة من مكتبة ImagePicker لإدارة فتح الاستوديو
  final ImagePicker _picker = ImagePicker();

  late TextEditingController nameController;
  late TextEditingController emailController;

  // متغير مراقب يحمل مسار الصورة الشخصية (ملف محلي أو رابط)
  var selectedImagePath = "".obs;

  @override
  void onInit() {
    super.onInit();
    // تعبئة الحقول تلقائياً بالبيانات الحالية من الـ ProfileController
    nameController = TextEditingController(text: _profileController.userName.value);
    emailController = TextEditingController(text: _profileController.email.value);
    selectedImagePath.value = _profileController.userImageUrl.value;
  }

  // 🌟 دالة فتح استوديو الهاتف واختيار صورة حقيقية
  void pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, // فتح معرض الصور
        imageQuality: 80,            // ضغط جودة الصورة لحفظ المساحة
      );

      if (pickedFile != null) {
        // تحديث المتغير المراقب بالمسار المحلي للصورة الجديدة فوراً
        selectedImagePath.value = pickedFile.path;
      }
    } catch (e) {
      print("حدث خطأ أثناء اختيار الصورة: $e");
    }
  }

  // دالة حفظ التعديلات وإرسالها للكنترولر الرئيسي
  void saveChanges() {
    // 1. تحديث قيم الكنترولر الأساسي فوراً لكي تنعكس بالواجهة الرئيسية للبروفايل
    _profileController.userName.value = nameController.text;
    _profileController.email.value = emailController.text;
    _profileController.userImageUrl.value = selectedImagePath.value;

    // 2. العودة للشاشة السابقة بسلاسة
    Get.back();

    // 3. عرض رسالة النجاح (Snackbar) المنسقة بثوابت مشروعكِ وبدون أخطاء الـ const
    Get.snackbar(
      '',
      '',
      titleText: const Text(
        "تم التحديث",
        style: TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: ColorManager.black,
        ),
      ),
      messageText: Text(
        "تم حفظ تعديلات الملف الشخصي بنجاح",
        style: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14,
          color: ColorManager.black.withOpacity(0.7),
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.white.withOpacity(0.95),
      borderRadius: 15,
      margin: const EdgeInsets.all(15),
      boxShadows: [
        BoxShadow(
          color: ColorManager.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        )
      ],
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}