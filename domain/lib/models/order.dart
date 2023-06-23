class Order {
  final int id;
  final String? orderIdVtext;
  final int customerId;
  final int referralId;
  final String? keyword;
  final String status;
  final String? warehouse;
  final double? amount;
  final int? paymentId;

  Order({
    required this.id,
    this.orderIdVtext,
    required this.customerId,
    required this.referralId,
    this.keyword,
    required this.status,
    this.warehouse,
    this.amount,
    this.paymentId,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      orderIdVtext: json['id_order_vtext'],
      customerId: json['id_customer'],
      referralId: json['id_referral'],
      keyword: json['keyword'],
      status: json['status'],
      warehouse: json['warehouse'],
      amount: json['amount'],
      paymentId: json['id_payment'],
    );
  }
}
