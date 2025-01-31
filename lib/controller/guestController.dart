import 'package:circuit_house_management/model/res/guest/guestResModel.dart';
import 'package:intl/intl.dart';

import '../Services/guestHelper.dart';

class GuestNotifier{

  List<GuestResModel> guestList = [];

  getAllGuestList()async{
    guestList = await GuestHelper.getGuest();
  }

  List<GuestResModel> filterCurrentGuest(int id ){
    // print(id);
    return guestList.where((guest){
      //print(guest.room_name);
      // very useful to see and compare
      // print(guest.roomId);
      // print(guest.roomId == id);
      return guest.roomId == id;
    }).toList();
  }

  List<GuestResModel> filteredGuest = [];   // only filtered Guest list here

  void filterGuestByDate(DateTime selectedDate){
    // Updated to 'dd-MM-yyyy' to match Guest list format
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

    filteredGuest =  guestList.where((guest) {
      // Parse guest.check_out_date to DateTime
      DateTime guestCheckoutDate = DateTime.parse(guest.check_out_date.toString());
      // Format guest checkout date to 'dd-MM-yyyy'
      String formattedCheckoutDate = DateFormat('dd-MM-yyyy').format(guestCheckoutDate);
      return formattedCheckoutDate == formattedDate;
    },).toList();
  }

}