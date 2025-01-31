class Guest {
  final int id;
  final String name;
  final DateTime checkInDate;
  final String motiveOfVisiting;
  final int totalPerson;
  final DateTime checkOutDate;
  final int roomId;
  final int totalDays;
  final double totalRentalPrice;
  final String signature;
  final String comment;

  Guest({
    required this.id,
    required this.name,
    required this.checkInDate,
    required this.motiveOfVisiting,
    required this.totalPerson,
    required this.checkOutDate,
    required this.roomId,
    required this.totalDays,
    required this.totalRentalPrice,
    required this.signature,
    required this.comment,
  });

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      name: json['name'],
      checkInDate: DateTime.parse(json['check_in_date']),
      motiveOfVisiting: json['motive_of_visiting'],
      totalPerson: json['total_person'],
      checkOutDate: DateTime.parse(json['check_out_date']),
      roomId: json['room_id'],
      totalDays: json['total_days'],
      totalRentalPrice: json['total_rental_price'],
      signature: json['signature'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'check_in_date': checkInDate.toIso8601String(),
      'motive_of_visiting': motiveOfVisiting,
      'total_person': totalPerson,
      'check_out_date': checkOutDate.toIso8601String(),
      'room_id': roomId,
      'total_days': totalDays,
      'total_rental_price': totalRentalPrice,
      'signature': signature,
      'comment': comment,
    };
  }
}
