class ProfileResModel {
  int? id;
  String? username;
  String? email;
  String? role;
  bool? isApproved;
  String? profilePicture;

  ProfileResModel(
      {this.id,
        this.username,
        this.email,
        this.role,
        this.isApproved,
        this.profilePicture});

  ProfileResModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    isApproved = json['is_approved'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['role'] = role;
    data['is_approved'] = isApproved;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
