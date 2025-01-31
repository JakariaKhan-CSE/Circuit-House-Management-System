import 'dart:convert';
import 'package:circuit_house_management/model/res/room/room_price_res.dart';
import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'config.dart';

class RoomHelper {
  // Get room
  static Future<List<RoomResModel>> getRooms() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };

    try {
      response = await http.get(
        Uri.parse('${Config.apiUrl}${Config.roomUrl}'),
        headers: requestHeaders,
      );
    } catch (e) {
      debugPrint('Get Room API Call Error: $e');
      throw Exception('Failed to connect to the server');
    }

    if (response.statusCode == 200) {
      try {
        // Decode response body as UTF-8 for Bengali support
        final decodedResponse = jsonDecode(utf8.decode(response.bodyBytes));
        // debugPrint('Decoded Response: $decodedResponse');

        // Parse the list of rooms from the decoded response
        List<RoomResModel> roomList = List<RoomResModel>.from(
          decodedResponse.map((x) => RoomResModel.fromJson(x)),
        );

        return roomList;
      } catch (e) {
        debugPrint('Error Parsing Room List: $e');
        throw Exception('Failed to parse room list');
      }
    } else {
      debugPrint('HTTP Error: ${response.statusCode}');
      throw Exception('Failed to get room list: HTTP ${response.statusCode}');
    }
  }

  // Get room price based on room type
static Future<List<RoomPriceResModel>> getRoomPrice()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };
    try {
      response = await http.get(
        Uri.parse('${Config.apiUrl}${Config.roomPriceUrl}'),
        headers: requestHeaders,
      );
    } catch (e) {
      debugPrint('Get Room Price API Call Error: $e');
      throw Exception('Failed to connect to the server');
    }

    if (response.statusCode == 200) {
      try {

        // Decode response body
        final decodedResponse = jsonDecode(response.body);
       // debugPrint('Decoded Response: $decodedResponse');

        // Parse the list of rooms from the decoded response
        List<RoomPriceResModel> roomPriceList = List<RoomPriceResModel>.from(
          decodedResponse.map((x) => RoomPriceResModel.fromJson(x)),
        );

        return roomPriceList;
      } catch (e) {
        debugPrint('Error Parsing Room Price List: $e');
        throw Exception('Failed to parse room Price list');
      }
    } else {
      debugPrint('HTTP Error: ${response.statusCode}');
      throw Exception('Failed to get room Price list: HTTP ${response.statusCode}');
    }
}

// room Availabilities Change Put Request
static Future<bool> roomStatusChange(RoomResModel model)async{
  http.Response response;
  Map<String, String> requestHeader = {
    "Content-Type": "application/json"
  };

  try{
    response = await http.put(Uri.parse('${Config.apiUrl}${Config.roomUrl}${model.id}/'),
    //response = await http.put(Uri.parse('https://chjashore.online/api/room/${model.id}/'),
    body: jsonEncode(model.toMap()),
      headers: requestHeader
    );

  }catch(e){
    debugPrint('Room Availabilities Change Call Error');
    return false;
  }
//   print('${Config.apiUrl}${Config.roomUrl}${model.id}/');
//   print(model.toMap());
// print(response.statusCode);
//


  if(response.statusCode == 200)
    {
      return true;
    }
  else{
    return false;
  }
}

}
