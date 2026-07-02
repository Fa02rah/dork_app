import 'dart:io'; // مهم جداً لقراءة ملف الصورة من ذاكرة الهاتف عبر كلاس File
import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart'; // 🌟 جلب ملف الألوان الخاص بمشروعكِ

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // فحص ذكي: هل القيمة عبارة عن مسار ملف محلي في الهاتف؟
    final bool isLocalFile = !imageUrl.startsWith('http') && imageUrl.isNotEmpty;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3), // مستدعى سابقاً من ألوانكِ
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 55,
          backgroundColor: ColorManager.white, // مستدعى سابقاً من ألوانكِ

          // استخدام مقطع شرطي لعرض الصورة حسب نوع المسار
          child: imageUrl.isEmpty
              ? Icon(
            Icons.person_rounded,
            size: 65,
            color: ColorManager.black.withOpacity(0.25), // 🌟 تعديل: جلب لون الأسود من ألوانكِ مع شفافية ناعمة للأيقونة
          )

          // إذا كانت صورة محلية تم اختيارها من الاستوديو
              : isLocalFile
              ? ClipOval(
            child: Image.file(
              File(imageUrl),
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          )

          // إذا كانت رابط إنترنت من السيرفر
              : ClipOval(
            child: Image.network(
              imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              // في حال كان الرابط خاطئاً أو توقف سيرفر الداتا بيز
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person_rounded,
                  size: 65,
                  color: ColorManager.black.withOpacity(0.25), // 🌟 تعديل: جلب لون الأسود من ألوانكِ عند الخطأ
                );
              },
              // مؤشر تحميل خفيف لحين تنزيل الصورة من الإنترنت
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(ColorManager.primary), // 🌟 تعديل: جعل مؤشر التحميل بلون المشروع الأساسي
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}