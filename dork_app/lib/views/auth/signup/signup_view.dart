import 'package:dork_app/core/constants/color_manager.dart';
import 'package:dork_app/views/auth/signup/widgets/go_to_login_button.dart';
import 'package:dork_app/views/auth/signup/widgets/signup_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/signup_controller.dart';
import '../../../core/utils/validation_helper.dart';
import '../../../core/widgets shared/custom_button.dart';
import '../../../core/widgets shared/custom_text_field.dart';
class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: ColorManager.black, size: 20),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              children: [
                const SignupHeader(),

                // 1. حقل الاسم الكامل
                CustomTextField(
                  controller: controller.nameController,
                  hintText: 'الاسم الكامل',
                  prefixIcon: Icons.person_outline,
                  validator: ValidationHelper.validateName,
                ),
                const SizedBox(height: 20),

                // 2. حقل البريد الإلكتروني
                CustomTextField(
                  controller: controller.emailController,
                  hintText: 'البريد الإلكتروني',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationHelper.validateEmail,
                ),
                const SizedBox(height: 20),

                // 3. حقل كلمة المرور
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'كلمة المرور',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  validator: ValidationHelper.validatePassword,
                ),
                const SizedBox(height: 20),

                // 4. حقل تأكيد كلمة المرور (الجديد بدلاً من رقم الهاتف)
                CustomTextField(
                  controller: controller.confirmPasswordController,
                  hintText: 'تأكيد كلمة المرور',
                  prefixIcon: Icons.lock_reset_outlined,
                  isPassword: true,
                  // نمرر القيمة الحالية للمقارنة مع كلمة المرور الأصلية
                  validator: (value) => ValidationHelper.validateConfirmPassword(
                    value,
                    controller.passwordController.text,
                  ),
                ),
                const SizedBox(height: 40),

                // زر إنشاء الحساب
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  text: 'إنشاء حساب',
                  onTap: () => controller.signup(),
                )),

                const SizedBox(height: 20),
                const GoToLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}