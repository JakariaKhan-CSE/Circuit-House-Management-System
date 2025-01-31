class NdcHonorBoard {
  final int id;
  final String name;
  final String batch;
  final DateTime joiningDate;
  final DateTime endingDate;
  final String photo;

  NdcHonorBoard({
    required this.id,
    required this.name,
    required this.batch,
    required this.joiningDate,
    required this.endingDate,
    required this.photo,
  });

  factory NdcHonorBoard.fromJson(Map<String, dynamic> json) {
    return NdcHonorBoard(
      id: json['id'],
      name: json['name'],
      batch: json['batch'],
      joiningDate: DateTime.parse(json['joining_date']),
      endingDate: DateTime.parse(json['ending_date']),
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'batch': batch,
      'joining_date': joiningDate.toIso8601String(),
      'ending_date': endingDate.toIso8601String(),
      'photo': photo,
    };
  }
}
