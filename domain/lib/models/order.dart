class Order {
  final int id;
  final int orderIdVtext;
  final int customerId;
  final int referralId;
  final String keyword;
  final String status;
  final int warehouse;
  final int? paymentId;

  Order({
    required this.id,
    required this.orderIdVtext,
    required this.customerId,
    required this.referralId,
    required this.keyword,
    required this.status,
    required this.warehouse,
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
      paymentId: json['id_payment'],
    );
  }
}
