import 'dart:convert';

class RegisterModel{
  final String email;
  final String password;

  RegisterModel({required this.email, required this.password});

  // create model from json data
  factory RegisterModel.fromMap(Map<String, dynamic> json){
    return RegisterModel(
        email: json['email'],
        password: json['password']);
  }


  // model to convert json
  Map<String, dynamic> toMap(){
    return {
      'email': email,
      'password': password
    };
  }

  String toJson() => jsonEncode(toMap());
  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(jsonDecode(source));

}