import 'dart:convert';

class LoginModel{
  final String username;
  final String password;

  LoginModel({required this.username, required this.password});

  // create model from json data
  factory LoginModel.fromMap(Map<String, dynamic> json){
    return LoginModel(
        username: json['username'],
        password: json['password']);
  }


  // model to convert json
Map<String, dynamic> toMap(){
    return {
      'username': username,
      'password': password
    };
}

String toJson()=> jsonEncode(toMap());
  factory LoginModel.fromJson(String source) => LoginModel.fromMap(jsonDecode(source));

}