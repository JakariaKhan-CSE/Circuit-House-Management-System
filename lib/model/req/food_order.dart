class FoodReqModel {
  String? date;
  String? foodMenu;
  String? orderTime;
  String? price;
  String? roomName;
  String? guestName;

  FoodReqModel(
      {this.date,
        this.foodMenu,
        this.orderTime,
        this.price,
        this.roomName,
        this.guestName});

  FoodReqModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    foodMenu = json['food_menu'];
    orderTime = json['Order_time'];
    price = json['price'];
    roomName = json['room_name'];
    guestName = json['guest_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['food_menu'] = foodMenu;
    data['Order_time'] = orderTime;
    data['price'] = price;
    data['room_name'] = roomName;
    data['guest_name'] = guestName;
    return data;
  }
}
