import 'package:dork_app/models/notification_model.dart';
import 'package:get/get.dart';
// قم بتغيير المسار حسب مشروعك


class NotificationController extends GetxController {
  // قائمة الإشعارات المرنة (تتحدث تلقائياً)
  var notificationsList = <NotificationModel>[].obs;
  // لحالة التحميل
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  // دالة جلب الإشعارات (هنا نضع بيانات وهمية لمحاكاة رد السيرفر)
  Future<void> fetchNotifications() async {
    try {
      isLoading(true);
      
      // محاكاة لطلب الـ API (تأخير ثانية واحدة)
      await Future.delayed(const Duration(seconds: 1));
      
      // البيانات الوهمية التي تطابق كلام صديقك "أيمن"
      List<Map<String, dynamic>> dummyData = [
        {
          "id": 1,
          "title": "اقتراب موعد دورك",
          "body": "باقي شخصين فقط على دورك في عيادة الأسنان، يرجى التواجد في صالة الانتظار."
        },
        {
          "id": 2,
          "title": "تم تأكيد الحجز بنجاح",
          "body": "مرحباً بك، تم حجز دورك بنجاح برقم #25 في قسم المعاملات القانونية."
        },
        {
          "id": 3,
          "title": "تعديل في حالة الطابور",
          "body": "نظراً لوجود حالة طارئة، قد يتم تأخير الأدوار بمعدل 10 دقائق. نشكر تفهمكم."
        }
      ];

      // تحويل البيانات لـ Models وإضافتها للقائمة
      notificationsList.assignAll(
        dummyData.map((json) => NotificationModel.fromJson(json)).toList()
      );
      
    } finally {
      isLoading(false);
    }
  }
}