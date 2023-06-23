class Payment {
  final int id;
  final int transactionId;
  final int orderId;
  final String createdAt;

  Payment({
    required this.id,
    required this.transactionId,
    required this.orderId,
    required this.createdAt,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      transactionId: json['id_transaction'],
      orderId: json['id_order'],
      createdAt: json['created_at'],
    );
  }
}
