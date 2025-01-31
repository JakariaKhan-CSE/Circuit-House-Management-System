
class RoomBookingOld {
  String guestName;       // Non-nullable
  String NID;             // Non-nullable
  String phone;           // Non-nullable
  String? motive;         // Nullable
  int totalPerson;        // Non-nullable
  String? remark;         // Nullable
  String selectedOrderType; // Nullable
  DateTime checkInDate;   // Non-nullable
  DateTime checkOutDate;  // Non-nullable

  RoomBookingOld({
    required this.guestName,
    required this.NID,
    required this.phone,
    this.motive,
    required this.totalPerson,
    this.remark,
    required this.selectedOrderType,
    required this.checkInDate,
    required this.checkOutDate,
  });

  // Factory method to create a Guest from a JSON map
  factory RoomBookingOld.fromJson(Map<String, dynamic> json) {
    return RoomBookingOld(
      guestName: json['guestName'],
      NID: json['NID'],
      phone: json['phone'],
      motive: json['motive'],
      totalPerson: json['totalPerson'],
      remark: json['remark'],
      selectedOrderType: json['selectedOrderType'],
      checkInDate: DateTime.parse(json['checkInDate']),
      checkOutDate: DateTime.parse(json['checkOutDate']),
    );
  }

  // Method to convert Guest to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'guestName': guestName,
      'NID': NID,
      'phone': phone,
      'motive': motive,
      'totalPerson': totalPerson,
      'remark': remark,
      'selectedOrderType': selectedOrderType,
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
    };
  }
}