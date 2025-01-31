
class GuestResModel{
  final int id;
  final String room_name;
  double? total_food_cost;
  double? total_other_cost;
  String? name;
  String? office;
  String? designation;
  String? user_type;
  String? nid;
  String? email;
  String? phone;
  String? check_in_date;
  String? check_out_date;
  String? motive_of_visiting;
  final int roomId;
  int? total_person;


  GuestResModel(  {
    required this.roomId,
    required this.id, required this.room_name,
    this.total_food_cost, this.total_other_cost,
    this.name, this.office, this.designation, this.user_type, this.nid,
    this.email, this.phone, this.check_in_date, this.check_out_date,
    this.motive_of_visiting, this.total_person
});


  GuestResModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
      room_name = json['room_name'] ?? '',
  roomId = json['room'],
  total_food_cost = json['total_food_cost'] != null ? double.tryParse(json['total_food_cost'].toString()) : null,
  total_other_cost = json['total_other_cost'] != null ? double.tryParse(json['total_other_cost'].toString()) : null,
  name = json['name'],
  office = json['office'],
  designation = json['designation'],
  user_type = json['user_type'],
  nid = json['nid'],
  email = json['email'],
  phone = json['phone'],
  check_in_date = json['check_in_date'],
  check_out_date = json['check_out_date'],
  motive_of_visiting = json['motive_of_visiting'],
  total_person = json['total_person'] != null ? int.tryParse(json['total_person'].toString()) : null
  ;  // see carefully





}