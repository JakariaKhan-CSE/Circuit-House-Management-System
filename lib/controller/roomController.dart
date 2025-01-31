import 'package:circuit_house_management/Services/roomHelper.dart';
import 'package:circuit_house_management/model/res/room/room_price_res.dart';
import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:circuit_house_management/view/ui/room_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RoomNotifier{

  List<RoomResModel> _rooms = [];
  List<RoomPriceResModel> roomPrices = [];
  List<RoomResModel> get rooms => _rooms;

  // Convert the list to a Future

  Future<List<RoomResModel>> getRoomsAsFuture() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate delay
    return _rooms;
  }

  Future<void> fetchRoom()async{
    try{
      _rooms = await RoomHelper.getRooms();
      // notifyListeners();

    }catch(e){
      debugPrint('Error Fetching rooms: $e');
      throw Exception('Failed to fetch rooms');
    }
  }

  //Future<List<RoomPriceResModel>>? roomPriceList;
  // get room price
  getAllRoomPrice()async{
    // model.access is token
  //  roomPriceList = RoomHelper.getRoomPrice();
    roomPrices = await RoomHelper.getRoomPrice();
  }

  List<RoomResModel> filterRooms({String? category, String? building}) {
  //  print("Filtering rooms with category: $category, building: $building");
    return _rooms.where((room) {
      bool matchesCategory = category == null || room.roomCategory == category;
      bool matchesBuilding = building == null || room.building == building;
      return matchesCategory && matchesBuilding;
    }).toList();
  }

  // price filtering based on days
  Map<String, Map<String, String>> filterPricesByGuestType(String roomType){
    Map<String, Map<String, String>> filteredData = {
      "Government Official": {
"1-3": "-",
        "4-7": "-",
        "7+" : "-"
      },
      "Autonomous" :{
        "1-3": "-",
        "4-7" : "-",
        "7+" : "-"
      },
      "Private Sector Employee":{
        "1-3" : "-",
        "4-7" : "-",
        "7+" : "-"
      }
    };

for(var price in roomPrices){
  // Check if the price matches the provided roomType
 if(price.roomType == roomType){
   if(price.userType == "Government Official"){
     filteredData['Government Official']?[price.daysRange!] = price.pricePerDay!;
   }
   else if(price.userType == 'Autonomous'){
     filteredData['Autonomous']?[price.daysRange!] = price.pricePerDay!;
   }
   else if(price.userType == "Private Sector Employee"){
     filteredData['Private Sector Employee']?['1-3'] = price.pricePerDay!;
     filteredData['Private Sector Employee']?['4-7'] = price.pricePerDay!;
     filteredData['Private Sector Employee']?['7+'] = price.pricePerDay!;
   }
 }
}
return filteredData;
  }


//   List<RoomResModel> filterRooms({required String? category,
//   String? building, String? floor}){
// return _rooms.where((room){
//   bool matchBuilding = building == null || room.building == building;
// bool matchCategory = category == null || room.roomCategory == category;
//
// bool matchFloor = floor == null || room.floor == floor;
// /*
// All three conditions must be true for the current room to pass the filter.
// If the room satisfies all three conditions, it is included in the filtered list.
//  */
// return matchCategory && matchBuilding && matchFloor;
// }).toList();
//   }

  // Future<List<RoomResModel>>? roomList ;

  // // get room
  // getAllRoom(){
  //   // model.access is token
  //   roomList = RoomHelper.getRooms();
  // }



  // update room availabilities change
updateRoomAvailabilitiy(RoomResModel model){
    RoomHelper.roomStatusChange(model).then((value) {
      if(value){
        Get.off(const RoomPage());
      }
      else{
        Get.snackbar('Failed', 'Room Availabilities Change Failed',backgroundColor: Colors.red);
      }
    },);
}
}
