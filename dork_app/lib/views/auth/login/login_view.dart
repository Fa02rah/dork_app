import 'package:dork_app/views/auth/login/widgets/go_to_signup_button.dart';
import 'package:dork_app/views/auth/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
import '../../../core/utils/validation_helper.dart';
import '../../../core/widgets shared/custom_button.dart';
import '../../../core/widgets shared/custom_text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. كتلة الرأس (الشعار والعناوين)
                const LoginHeader(),
                const SizedBox(height: 50),

                // 2. حقل البريد الإلكتروني
                CustomTextField(
                  controller: controller.emailController,
                  hintText: 'البريد الإلكتروني',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationHelper.validateEmail,                ),
                const SizedBox(height: 20),

                // 3. حقل كلمة المرور
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icons.lock_outlined,
                  isPassword: true,
                  // هنا نستخدم فحص "هل الحقل فارغ" فقط، لأن السيرفر هو من سيقرر صحة الكلمة
                  validator: (value) => value!.isEmpty ? 'يرجى إدخال كلمة المرور' : null,                ),
                const SizedBox(height: 40),

                // 4. زر تسجيل الدخول
                Obx(() => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                  text: 'تسجيل دخول',
                  onTap: () => controller.login(),
                )),
                const SizedBox(height: 30),

                // 5. زر الانتقال لإنشاء حساب
                const GoToSignUpButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
