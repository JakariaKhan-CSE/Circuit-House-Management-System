
import 'package:circuit_house_management/Controller/bookingController.dart';
import 'package:circuit_house_management/model/req/room_booking.dart';
import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:circuit_house_management/view/ui/widget/booking_page_row_item.dart';
import 'package:circuit_house_management/view/ui/widget/textDummyStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/custom_button.dart';

class BookingPage extends StatefulWidget {
  final RoomResModel room;
  final int roomId;
  const BookingPage({super.key, required this.room, required this.roomId});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  BookingNotifier bookingNotifier = BookingNotifier();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController guestName = TextEditingController();
  final TextEditingController NID = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController motive = TextEditingController();
  final TextEditingController totalPerson = TextEditingController();
  final TextEditingController remark = TextEditingController();


  // guest dropdown menu items
  // bangle
  //final List<String> guestTypes = <String>['সরকারী/অবসরপ্রাপ্ত কর্মকর্তা', 'সংবিধিবদ্ধ সংস্থা/স্বায়ত্তশাসিত-কর্মকর্তা ', 'বেসরকারী ব্যক্তিবর্গ/কর্মকর্তা'];
  final List<String> guestTypes = <String>['Government Official', 'Autonomous', 'Private Sector Employee'];
  String? selectedOrderType; // Initialized as null for no default selection


  DateTime? checkInDate;
  DateTime? checkOutDate;

  // Function to show check in date picker
  Future<void> _selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  // Function to show check out date picker
  Future<void> _selectCheckOutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != checkOutDate) {
      setState(() {
        checkOutDate = picked;
      });
    }
  }

  // Function to calculate the total days between check-in and check-out dates
  int calculateTotalDays() {
    if (checkInDate != null && checkOutDate != null) {
      return checkOutDate!.difference(checkInDate!).inDays;
    }
    return 0; // Return 0 if either of the dates is null
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    guestName.dispose();
    NID.dispose();
    phone.dispose();
    motive.dispose();
    totalPerson.dispose();
    remark.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4EDE6),
body: SingleChildScrollView(
  child: Center(
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Textdummystyle(btnTxt: widget.room.roomName??'',),
          const SizedBox(height: 20),
          booking_page_row_item(controller: guestName,leftText: 'Guest Name',hintText: 'Enter Guest Name',),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Guest Type',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 40, // Increased height for better UX
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDFFFF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Text(
                          'Select Guest Type',
                          style: TextStyle(color: Colors.black54),
                        ),
                        value: selectedOrderType,
                        icon: const Icon(Icons.arrow_downward),
                        isExpanded: true,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOrderType = newValue;
                          });
                        },
                        items: guestTypes.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          booking_page_row_item(controller: NID,leftText: 'NID/BR',hintText: 'Enter NID/BR',),
          booking_page_row_item(controller: phone,leftText: 'Phone',hintText: 'Enter Phone',),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Check-in-Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: () => _selectCheckInDate(context),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            checkInDate == null
                                ? 'Select a Date'
                                : DateFormat('EEEE d yyyy').format(checkInDate!),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Icon(Icons.calendar_today, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Check-Out-Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: GestureDetector(
                    onTap: () => _selectCheckOutDate(context),
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDFFFF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            checkOutDate == null
                                ? 'Select a Date'
                                : DateFormat('EEEE d yyyy').format(checkOutDate!),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Icon(Icons.calendar_today, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          booking_page_row_item(controller: motive,leftText: 'Motive of Visiting',hintText: 'Enter Motive of Visiting',isValidtorEnable: false,),
          booking_page_row_item(controller: totalPerson,leftText: 'Total Person',
            hintText: 'Enter Total Person',),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    'Total Days',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: // Usage in the widget
                      Text(
                        checkInDate != null && checkOutDate != null
                            ? '${calculateTotalDays()} days'  // Display total days if both dates are selected
                            : 'Select check-in and check-out',  // Prompt user to select dates if not selected
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          booking_page_row_item(controller: remark,leftText: 'Remarks',
            hintText: 'Enter Your Comment About The Guest',isValidtorEnable: false,),
          const SizedBox(height: 20),
          CustomButton(pressed: (){
            print('confirm booking page btn click');

            if(_formKey.currentState!.validate()){
              if(selectedOrderType==null || checkInDate==null || checkOutDate==null)
              {
                Get.snackbar('Field Empty', 'Please provide all information',backgroundColor: Colors.orange);
              }
              else{
                BookingReqModel model = BookingReqModel(
                  name: guestName.text,
                  userType: selectedOrderType,
                  nid: NID.text,
                  phone: phone.text,
                  checkInDate: DateFormat('yyyy-MM-dd').format(checkInDate!),
                  checkOutDate: DateFormat('yyyy-MM-dd').format(checkOutDate!),
                  motiveOfVisiting: motive.text,
                  totalPerson: int.tryParse(totalPerson.text),
                  totalDays: calculateTotalDays(),
                  room: widget.roomId,
                  comment: remark.text
                );

               bookingNotifier.roomBooking(model);

              }
            }

          }, btnName: 'Confirm Booking',backgroundColor: const Color(0xFF34A864),
          foregroundColor: Colors.black,
          ),
          const SizedBox(height: 20),
        ],
      ),
    ),
  ),
)
    );
  }
}


