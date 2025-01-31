class RoomResModel {
  final int id;
  final String roomName;
  final String roomType;
  final String roomCategory;
  final String availabilityStatus;
  final String building;
  final String floor;

  RoomResModel({
    required this.id,
    required this.roomName,
    required this.roomType,
    required this.roomCategory,
    required this.availabilityStatus,
    required this.building,
    required this.floor,
  });

  factory RoomResModel.fromJson(Map<String, dynamic> json) {
    return RoomResModel(
      id: json['id'],
      roomName: json['room_name'],
      roomType: json['room_type'],
      roomCategory: json['room_category'],
      availabilityStatus: json['availability_status'],
      building: json['building'],
      floor: json['floor'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'room_name': roomName,
      'room_type': roomType,
      'room_category': roomCategory,
      'availability_status': availabilityStatus,
      'building':building,
      'floor': floor
    };
  }
}
