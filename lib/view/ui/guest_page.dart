import 'package:circuit_house_management/Controller/guestController.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/sign_in_user_drawer.dart';
import 'package:circuit_house_management/view/ui/widget/table_component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/stringToDate.dart';


class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  GuestNotifier guestNotifier = GuestNotifier();
  DateTime? selectedDate;

  //List<GuestOld> filteredGuests = [];

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        guestNotifier.filterGuestByDate(picked);
        //_filterGuestsByDate(picked);
      });
    }
  }

  // Filter guests based on the selected date
  // void _filterGuestsByDate(DateTime selectedDate) {
  //   // Updated to 'dd-MM-yyyy' to match Guest list format
  //   String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
  //   filteredGuests =
  //       guestList.where((guest) => guest.checkInDate == formattedDate).toList();
  // }

  @override
  void initState() {
    super.initState();
    guestNotifier.getAllGuestList();  // load all guest data from backend
    guestNotifier.filterGuestByDate(
        DateTime.now()); // Default to today's checkout guests
    //_filterGuestsByDate(DateTime.now()); // Default to today's guests
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACD2C7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        elevation: 8,
        title: const Text('Circuit House, Jashore'),
        centerTitle: true,
      ),
      drawer: signInUserDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select Check-out Date for Guest List',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFACD2C7).withOpacity(0.7),
                        foregroundColor: Colors.black87),
                    onPressed: () => _selectDate(context),
                    child: Text(
                      selectedDate == null
                          ? 'Select a Date'
                          : DateFormat('dd-MM-yyyy').format(selectedDate!),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
           // if (filteredGuests.isEmpty)
            if(guestNotifier.filteredGuest.isEmpty)
              const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "No guests for this date",
                  style: TextStyle(color: Colors.black87, fontSize: 20),
                ),
              ))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: guestNotifier.filteredGuest.length,
                  itemBuilder: (context, index) {
                    final guest = guestNotifier.filteredGuest[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          CircleAvatar(
                            radius: 15,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Table(
                            border: TableBorder.all(
                              color: Colors.black.withOpacity(0.3),
                              width: 1,
                            ),
                            columnWidths: const {
                              0: FlexColumnWidth(4),
                              1: FlexColumnWidth(5),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: [
                                  const AnotherHeading(
                                    text: 'Name',
                                  ),
                                  AnotherData(
                                    text:
                                        '${guest.name}', // Mock data
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const AnotherHeading(text: 'Room Name'),
                                  AnotherData(text: guest.room_name),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const AnotherHeading(
                                      text: 'Motive of Visiting'),
                                  AnotherData(text: guest.motive_of_visiting.toString()),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const AnotherHeading(text: 'Check-In Date'),
                                  AnotherData(text: stringToDateConvert.formateDateFromString(guest.check_in_date.toString())),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const AnotherHeading(
                                      text: 'Check out Date'),
                                  AnotherData(text: stringToDateConvert.formateDateFromString(guest.check_out_date.toString())),
                                ],
                              ),
                              // TableRow(children: [
                              //   const AnotherHeading(text: 'More info'),
                              //   AnotherData(
                              //       text: 'See Details',
                              //       isButton: true,
                              //       isBold: true,
                              //       onTap: () {
                              //         // Navigate to SeeDetails page
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (_) => const SeeDetails()),
                              //         );
                              //       }),
                              // ]),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
