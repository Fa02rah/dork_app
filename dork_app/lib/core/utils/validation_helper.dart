class ValidationHelper {
  // 1. التحقق من الاسم (بقي كما هو)
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال الاسم الكامل';
    }
    if (value.length < 3) {
      return 'الاسم يجب أن يكون أكثر من 3 أحرف';
    }
    return null;
  }

  // 2. التحقق من البريد الإلكتروني (بقي كما هو)
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (!RegExp(pattern).hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }
    return null;
  }

  // 3. التحقق من كلمة المرور (بقي كما هو)
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن لا تقل عن 8 خانات';
    }
    return null;
  }

  // 4. الدالة الجديدة: التحقق من تطابق كلمة المرور
  // تأخذ القيمة المدخلة (value) وقيمة كلمة المرور الأصلية للمقارنة
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }
    if (value != password) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }
}