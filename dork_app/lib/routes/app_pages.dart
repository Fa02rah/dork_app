import 'package:dork_app/views/appointments/controller/appointments_controller.dart';
import 'package:dork_app/views/home/appointments_view.dart';
import 'package:dork_app/views/ticket/controller/ticket_controller.dart';
import 'package:dork_app/views/ticket/ticket_view.dart';
import 'package:get/get.dart';
import '../bindings/auth/login_binding.dart';
import '../bindings/auth/signup-binding.dart';
import '../views/onboarding/onboarding_controller/onboarding_controller.dart';
import '../views/auth/login/login_view.dart';
import '../views/auth/signup/signup_view.dart';
import '../views/home/details/category_details_view.dart';
import '../views/home/details/controller/category_details_controller.dart';
import '../views/home/profile/controller/profile_controller.dart';
import '../views/home/profile/profile_view.dart';
import '../views/home/provider_details/provider_details_view.dart';
import '../views/home/provider_details/controller/provider_details_controller.dart';
import '../views/home/home_view.dart';
import '../views/home/service_booking/controller/service_booking_controller.dart';
import '../views/home/service_booking/service_booking_view.dart';
import '../views/onboarding/onboarding_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
    ),

    // صفحة تفاصيل الصنف (مثل قائمة البنوك)
    GetPage(
      name: AppRoutes.CATEGORY_DETAILS,
      page: () => const CategoryDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CategoryDetailsController>(() => CategoryDetailsController());
      }),
      transition: Transition.cupertino,
    ),

    // صفحة تفاصيل المزود (مثل قائمة خدمات البنك)
    GetPage(
      name: AppRoutes.PROVIDER_DETAILS,
      page: () => const ProviderDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ProviderDetailsController>(() => ProviderDetailsController());
      }),
      transition: Transition.cupertino,
    ),

    // صفحة حجز الخدمة (تم تصحيح الأقواس هنا)
    GetPage(
      name: AppRoutes.SERVICE_BOOKING,
      page: () => const ServiceBookingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ServiceBookingController>(() => ServiceBookingController());
      }),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.PROFILE, // أو AppRoutes.PROFILE حسب ما اعتمدتيه في ملف AppRoutes
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        // حقن الكنترولر بطريقة ذكية؛ ليتم إنشاؤه فقط عند دخول الصفحة وحذفه عند الخروج لتوفير الذاكرة
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
      transition: Transition.cupertino, // حركة انتقال ناعمة متوافقة مع الـ iOS
    ),
    
    GetPage(
      name: AppRoutes.TICKET,
      page: () => const TicketView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<TicketController>(() => TicketController());
      }),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.APPOINTMENTS,
      page: () => const AppointmentsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AppointmentsController>(() => AppointmentsController());
      }),
      transition: Transition.cupertino,),// <--- إغلاق الـ GetPage
  ]; // <--- إغلاق قائمة الـ pages
} // <--- إغلاق كلاس AppPages