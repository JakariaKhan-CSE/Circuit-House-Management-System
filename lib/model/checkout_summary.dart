class CheckoutSummary {
  final int id;
  final int guestId;
  final double totalRentalCost;
  final double totalFoodCost;
  final double grandTotal;
  final String paymentId;
  final String paymentStatus;
  final DateTime createdAt;

  CheckoutSummary({
    required this.id,
    required this.guestId,
    required this.totalRentalCost,
    required this.totalFoodCost,
    required this.grandTotal,
    required this.paymentId,
    required this.paymentStatus,
    required this.createdAt,
  });

  factory CheckoutSummary.fromJson(Map<String, dynamic> json) {
    return CheckoutSummary(
      id: json['id'],
      guestId: json['guest_id'],
      totalRentalCost: json['total_rental_cost'],
      totalFoodCost: json['total_food_cost'],
      grandTotal: json['grand_total'],
      paymentId: json['payment_id'],
      paymentStatus: json['payment_status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guest_id': guestId,
      'total_rental_cost': totalRentalCost,
      'total_food_cost': totalFoodCost,
      'grand_total': grandTotal,
      'payment_id': paymentId,
      'payment_status': paymentStatus,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
