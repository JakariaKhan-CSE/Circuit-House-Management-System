class User {
  final int id;
  final String username;
  final String password;
  final String email;
  final int phone;
  final String role;
  final bool isApproved;
  final String profilePicture;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.role,
    required this.isApproved,
    required this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      isApproved: json['is_approved'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'role': role,
      'is_approved': isApproved,
      'profile_picture': profilePicture,
    };
  }
}
