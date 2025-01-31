import 'dart:convert';

class SignUpModel {
  final String username;
  final String profile_picture;
  final String email;
  final String password;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.profile_picture,
  });

  factory SignUpModel.fromMap(Map<String, dynamic> json){
    return SignUpModel(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        profile_picture: json['profile_picture']);
  }

  Map<String, dynamic> toMap(){
    return{
      'username': username,
      'email': email,
      'password': password,
      'profile_picture': profile_picture
    };
  }

  String toJson() => jsonEncode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(jsonDecode(source));


}
