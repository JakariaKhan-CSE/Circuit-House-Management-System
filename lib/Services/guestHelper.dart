import 'dart:convert';

import 'package:circuit_house_management/Services/config.dart';
import 'package:circuit_house_management/model/res/guest/guestResModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GuestHelper{
  // get guest data
  static Future<List<GuestResModel>> getGuest()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  http.Response? response;
  Map<String, String> requestHeader = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token"
  };

  try{
    response = await http.get(Uri.parse('${Config.apiUrl}${Config.guestUrl}'),
    headers: requestHeader
    );
  }catch(e){
    debugPrint('Get Guest API call error $e');
    throw Exception('Failed to connect to the server');
  }

  if(response.statusCode == 200){
    try{
      final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
    // debugPrint('Decoded Response : $decodedResponse');

      // parse the list of guest from decoded response
      List<GuestResModel> guestList = List<GuestResModel>.from(
        decodedResponse.map((x) => GuestResModel.fromJson(x))
      );

      return guestList;

    }catch(e){
      debugPrint('Error parsing Guest List: $e');
      throw Exception('Failed to parse Guest List');
    }
  }
  else{
    debugPrint('HTTP error: ${response.statusCode}');
    throw Exception('Failed to get Guest List ${response.statusCode}');
  }

  }
}