class ServiceModel {
  final int id;
  final String title;
  final String description;
  final String image;
  // هذا الحقل يربط الخدمة بالمزود (مثل بنك الرافدين) في قاعدة البيانات
  final int providerId;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.providerId,
  });

  // المصنع (Factory) لتحويل البيانات القادمة من السيرفر (JSON) إلى كائن البرمجة
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      providerId: json['provider_id'] ?? 0,
    );
  }

  // ميزة إضافية: تحويل الكائن إلى JSON (مفيد إذا كنتِ ستخزنين بيانات محلياً)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'provider_id': providerId,
    };
  }
}