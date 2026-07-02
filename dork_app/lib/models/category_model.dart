class CategoryModel {
  final int id;
  final String name;
  final String image;
  // إضافة هذا الحقل سيساعدك في جلب البيانات من الداتابيز بسهولة أكبر
  final String categoryKey;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryKey, // مثل: 'banks', 'clinics', 'gov'
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      categoryKey: json['categoryKey'] ?? '', // التأكد من عدم وجود قيمة فارغة
    );
  }
}