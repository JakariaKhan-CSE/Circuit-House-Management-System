class RoomPriceResModel {
  int? id;
  String? userType;
  String? roomType;
  String? daysRange;
  String? pricePerDay;

  RoomPriceResModel(
      {this.id,
        this.userType,
        this.roomType,
        this.daysRange,
        this.pricePerDay});

  RoomPriceResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    roomType = json['room_type'];
    daysRange = json['days_range'];
    pricePerDay = json['price_per_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_type'] = userType;
    data['room_type'] = roomType;
    data['days_range'] = daysRange;
    data['price_per_day'] = pricePerDay;
    return data;
  }
}
