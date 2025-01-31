import 'dart:convert';
import 'package:circuit_house_management/Services/config.dart';
import 'package:circuit_house_management/model/req/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class AuthHelper{

  // User login
  static Future<bool> login(LoginModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
    };

    try {
      response = await http.post(
        Uri.parse('${Config.apiUrl}${Config.loginUrl}'),
        body: model.toJson(),
        headers: requestHeaders,
      );
    } catch (e) {
      debugPrint('Login Api Call Error: $e');
      return false;
    }

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      // Set the token in AuthNotifier
      String token = responseData['access'];
      // print('login time: $token');
      await prefs.setString('token', token);
      await prefs.setBool('loggedIn', true);
      return true;
    } else {
      return false;
    }
  }

  
//   // user register
// static Future<bool> register(SignUpModel model)async{
//     http.Response? response;
//     Map<String, String> requestheaders = {
//       "Content-Type": "application/json"
//     };
//
//     try{
//       response = await http.post(Uri.parse('${Config.apiUrl}${Config.registerUrl}'),
//       body: model.toJson(),
//         headers: requestheaders
//       );
//     }
//     catch(e){
//       debugPrint('Register Api Call Error');
//     }
// print(response?.statusCode);
//   // successfully login
//   if(response?.statusCode == 200)
//     {
//       return true;
//     }
//   else{
//     return false;
//   }
// }
//
// // Get Profile
//   static Future<ProfileResModel> getProfile() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     String? token = pref.getString('token');
//     http.Response? response;
//     Map<String, String> requestHeaders = {
//       "Content-Type": "application/json",
//       "Authorization": 'Bearer $token'
//     };
//     try {
//       response = await http.get(
//         Uri.parse('${Config.apiUrl}${Config.profileUrl}'),
//         headers: requestHeaders,
//       );
//     } catch (e) {
//       debugPrint('Get Profile API Call Error: $e');
//       throw Exception('Failed to connect to the server');
//     }
//
//     if (response.statusCode == 200) {
//       ProfileResModel profile;
//       print(jsonDecode(response.body));
//       profile = ProfileResModel.fromJson(jsonDecode(response.body));
//
//       return profile;
//     } else {
//       throw Exception('Failed to get Profile data');
//     }
//   }
  
}
