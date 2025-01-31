import 'package:circuit_house_management/Services/foodHelper.dart';
import 'package:circuit_house_management/model/req/food_order.dart';
import 'package:circuit_house_management/view/ui/room_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodNotifier {
  // food order
  foodOrder(FoodReqModel model){
    FoodHelper.foodOrder(model).then((value) {
      if(value)
        {
          Get.snackbar('Food Order Successfully', '',backgroundColor: Colors.green);
          Get.to(const RoomPage());
        }
      else{
        Get.snackbar('Food Order Failed', 'Please try again',backgroundColor: Colors.red);
      }
    },);
  }
}