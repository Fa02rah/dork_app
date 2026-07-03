class WalletModel {
  final int id;
  final int userId;
  final double balance;
  final double heldBalance;
  final String status;

  WalletModel({
    required this.id,
    required this.userId,
    required this.balance,
    required this.heldBalance,
    required this.status,
  });

  // تحويل البيانات القادمة من الـ API (JSON) إلى كائن من هذا النوع
  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'],
      userId: json['user_id'],
      // التأكد من تحويل القيم إلى double لتفادي أخطاء النوع
      balance: (json['balance'] ?? 0.0).toDouble(),
      heldBalance: (json['held_balance'] ?? 0.0).toDouble(),
      status: json['status'] ?? 'active',
    );
  }
}