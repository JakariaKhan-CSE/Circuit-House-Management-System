class Food {
  final int id;
  final int guestId;
  final DateTime date;
  final String foodMenu;
  final String option;
  final double price;

  Food({
    required this.id,
    required this.guestId,
    required this.date,
    required this.foodMenu,
    required this.option,
    required this.price,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      guestId: json['guest_id'],
      date: DateTime.parse(json['date']),
      foodMenu: json['food_menu'],
      option: json['option'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'guest_id': guestId,
      'date': date.toIso8601String(),
      'food_menu': foodMenu,
      'option': option,
      'price': price,
    };
  }
}
