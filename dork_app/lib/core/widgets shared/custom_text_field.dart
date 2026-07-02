import 'package:flutter/material.dart';
import '../constants/color_manager.dart';
import '../theme/text_style.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  // الإضافة الجديدة لدعم البحث والفلترة اللحظية
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged, // تمرير الدالة هنا
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ظل ناعم جداً ليعطي فخامة للتصميم
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChanged, // ربط الدالة بالـ TextFormField
        textAlign: TextAlign.right,
        style: TextStyles.bodyText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.bodyText.copyWith(color: Colors.grey.shade400),
          prefixIcon: Icon(widget.prefixIcon, color: ColorManager.primary, size: 22),

          // أيقونة العين في حال كان الحقل لكلمة المرور
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.grey,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,

          // 1. الإطار الافتراضي (Enabled)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),

          // 2. الإطار عند التركيز (Focused) - يصبح أسمك وباللون الأساسي
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ColorManager.primary,
              width: 2,
            ),
          ),

          // 3. إطار الخطأ (Error)
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: ColorManager.error, width: 1),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: ColorManager.error, width: 2),
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
      ),
    );
  }
}