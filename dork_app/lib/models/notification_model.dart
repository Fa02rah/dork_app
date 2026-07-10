class NotificationModel {
  final int? id;
  final String title;
  final String body;
  final DateTime? createdAt;

  NotificationModel({
    this.id,
    required this.title,
    required this.body,
    this.createdAt,
  });

  // لتحويل الـ JSON القادم من الـ API إلى الـ Model
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
    );
  }
}