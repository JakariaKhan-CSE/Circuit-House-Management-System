class Room {
  final int id;
  final String roomName;
  final String roomDescription;
  final String availabilityStatus;
  final String roomLocation;
  final double dailyRoomRate;
  final int totalBedrooms;

  Room( {
    required this.id,
    required this.roomName,
    required this.roomDescription,
    required this.availabilityStatus,
    required this.roomLocation,
    required this.dailyRoomRate,
    required this.totalBedrooms,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      roomName: json['room_name'],
      roomDescription: json['room_description'],
      availabilityStatus: json['availability_status'],
      roomLocation: json['room_location'],
      dailyRoomRate: json['daily_room_rate'],
      totalBedrooms: json['total_bedroom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_name': roomName,
      'room_description': roomDescription,
      'availability_status': availabilityStatus,
      'room_location': roomLocation,
      'daily_room_rate': dailyRoomRate,
      'total_bedroom': totalBedrooms,
    };
  }
}
