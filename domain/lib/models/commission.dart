class Commission {
  final String id;
  final int orderId;
  final int sellerId;
  final int parentSellerId;
  final double amountSeller;
  final double parentAmountSeller;
  final String createdAt;

  Commission({
    required this.id,
    required this.orderId,
    required this.sellerId,
    required this.parentSellerId,
    required this.amountSeller,
    required this.parentAmountSeller,
    required this.createdAt,
  });

  factory Commission.fromJson(Map<String, dynamic> json) {
    return Commission(
      id: json['id'],
      orderId: json['id_order'],
      sellerId: json['id_seller'],
      parentSellerId: json['id_parent_seller'],
      amountSeller: json['amount_seller'],
      parentAmountSeller: json['amount_parent_seller'],
      createdAt: json['created_at'],
    );
  }
}
