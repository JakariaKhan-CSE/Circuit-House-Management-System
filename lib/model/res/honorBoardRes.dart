import 'dart:convert';

List<HonorBoardResModel> allDCHonorResFromJson(String str) => List<HonorBoardResModel>.from(json.decode(str).map((x) => HonorBoardResModel.fromJson(x)));

//String allDCHonorResToJson(List<HonorBoardResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HonorBoardResModel {
  int? id;
  String? name;
  String? batch;
  String? joiningDate;
  String? endingDate;
  String? photo;
  String? remarks;
  String? designationType;

  HonorBoardResModel(
      {this.id,
        this.name,
        this.batch,
        this.joiningDate,
        this.endingDate,
        this.photo,
        this.remarks,
        this.designationType});

  HonorBoardResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    batch = json['batch'];
    joiningDate = json['joining_date'];
    endingDate = json['ending_date'];
    photo = json['photo'];
    remarks = json['remarks'];
    designationType = json['designation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['batch'] = batch;
    data['joining_date'] = joiningDate;
    data['ending_date'] = endingDate;
    data['photo'] = photo;
    data['remarks'] = remarks;
    data['designation_type'] = designationType;
    return data;
  }


}
