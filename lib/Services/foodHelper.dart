import 'dart:convert';

import 'package:circuit_house_management/model/req/food_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'config.dart';
class FoodHelper{

  // post food
  static Future<bool> foodOrder(FoodReqModel model) async {
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
        Uri.parse('${Config.apiUrl}${Config.foodUrl}'),
    //    body: utf8.encode(jsonEncode(model.toJson())), // Convert JSON to UTF-8 encoded bytes (so that backend can support bengali)
      body: jsonEncode(model.toJson()),
        headers: requestHeaders,
      );
    } catch (e) {
      debugPrint('Food Api Call Error: $e');
      return false;
    }

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');


    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}