class FoodOrderOld {
  String selectedOrderType;
  String selectedRoomName;
  String foodMenu;  // String for food menu
  double price;     // Double for price
  DateTime selectedDate; // DateTime for selected date

  FoodOrderOld({
    required this.selectedOrderType,
    required this.selectedRoomName,
    required this.foodMenu,
    required this.price,
    required this.selectedDate,
  });

  // Factory method to create an FoodOrder from a JSON map
  factory FoodOrderOld.fromJson(Map<String, dynamic> json) {
    return FoodOrderOld(
      selectedOrderType: json['selectedOrderType'],
      selectedRoomName: json['selectedRoomName'],
      foodMenu: json['foodMenu'],
      price: json['price']?.toDouble() ?? 0.0,
      selectedDate: DateTime.parse(json['selectedDate']),
    );
  }

  // Method to convert FoodOrder to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'selectedOrderType': selectedOrderType,
      'selectedRoomName': selectedRoomName,
      'foodMenu': foodMenu,
      'price': price,
      'selectedDate': selectedDate.toIso8601String(),
    };
  }
}