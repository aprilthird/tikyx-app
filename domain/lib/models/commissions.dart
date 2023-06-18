class Commission {
  final int id;
  final String date;
  final String order;
  final int statusCode;
  final String user;
  final double amount;

  Commission(
      {required this.id,
      required this.date,
      required this.order,
      required this.statusCode,
      required this.user,
      required this.amount});
}
