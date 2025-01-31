import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../model/req/room_booking.dart';
import 'config.dart';
class BookingHelper{

  // post booking
  static Future<bool> roomBooking(BookingReqModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    http.Response? response;
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": 'Bearer $token'
    };

    print(model.toJson());
    try {
      response = await http.post(
        Uri.parse('${Config.apiUrl}${Config.bookingUrl}'),
      body: jsonEncode(model.toJson()),
        headers: requestHeaders,
      );
    } catch (e) {
      debugPrint('Room Booking Api Call Error: $e');
      return false;
    }

    // print('Response status: ${response.statusCode}');
    //
    // print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');


    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}