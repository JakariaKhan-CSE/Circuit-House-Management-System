class BookingReqModel {
  int? id;
  String? roomName;
  int? totalFoodCost;
  int? totalOtherCost;
  String? name;
  String? office;
  String? designation;
  String? userType;
  String? nid;
  String? email;
  String? phone;
  String? checkInDate;
  String? checkOutDate;
  int? totalPerson;
  String? motiveOfVisiting;
  int? totalDays;
  String? totalRentalPrice;
  String? comment;
  int? room;

  BookingReqModel(
      {this.id,
        this.roomName,
        this.totalFoodCost,
        this.totalOtherCost,
        this.name,
        this.office,
        this.designation,
        this.userType,
        this.nid,
        this.email,
        this.phone,
        this.checkInDate,
        this.checkOutDate,
        this.totalPerson,
        this.motiveOfVisiting,
        this.totalDays,
        this.totalRentalPrice,
        this.comment,
        this.room});

  BookingReqModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['room_name'];
    totalFoodCost = json['total_food_cost'];
    totalOtherCost = json['total_other_cost'];
    name = json['name'];
    office = json['office'];
    designation = json['designation'];
    userType = json['user_type'];
    nid = json['nid'];
    email = json['email'];
    phone = json['phone'];
    checkInDate = json['check_in_date'];
    checkOutDate = json['check_out_date'];
    totalPerson = json['total_person'];
    motiveOfVisiting = json['motive_of_visiting'];
    totalDays = json['total_days'];
    totalRentalPrice = json['total_rental_price'];
    comment = json['comment'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_name'] = roomName;
    data['total_food_cost'] = totalFoodCost;
    data['total_other_cost'] = totalOtherCost;
    data['name'] = name;
    data['office'] = office;
    data['designation'] = designation;
    data['user_type'] = userType;
    data['nid'] = nid;
    data['email'] = email;
    data['phone'] = phone;
    data['check_in_date'] = checkInDate;
    data['check_out_date'] = checkOutDate;
    data['total_person'] = totalPerson;
    data['motive_of_visiting'] = motiveOfVisiting;
    data['total_days'] = totalDays;
    data['total_rental_price'] = totalRentalPrice;
    data['comment'] = comment;
    data['room'] = room;
    return data;
  }
}
