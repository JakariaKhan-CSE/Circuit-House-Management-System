import 'package:circuit_house_management/Services/bookingHelper.dart';
import 'package:circuit_house_management/model/req/room_booking.dart';
import 'package:circuit_house_management/view/ui/room_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingNotifier {
  // food order
  roomBooking(BookingReqModel model){
    BookingHelper.roomBooking(model).then((value) {
      if(value)
        {
          Get.snackbar('Room Booking Successfully', '',backgroundColor: Colors.green);
          Get.to(const RoomPage());
        }
      else{
        Get.snackbar('Room Booking Failed', 'Please try again',backgroundColor: Colors.red);
      }
    },);
  }
}