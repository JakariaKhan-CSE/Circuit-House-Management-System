import 'package:circuit_house_management/Controller/guestController.dart';
import 'package:circuit_house_management/Controller/roomController.dart';
import 'package:circuit_house_management/common/stringToDate.dart';
import 'package:circuit_house_management/model/res/guest/guestResModel.dart';
import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:circuit_house_management/view/ui/widget/table_component.dart';
import 'package:flutter/material.dart';

class SeeDetailsRoom extends StatefulWidget {
  final RoomResModel room;
  const SeeDetailsRoom({super.key, required this.room});

  @override
  State<SeeDetailsRoom> createState() => _SeeDetailsRoomState();
}

class _SeeDetailsRoomState extends State<SeeDetailsRoom> {

  RoomNotifier roomNotifier = RoomNotifier();
  GuestNotifier guestNotifier = GuestNotifier();

  final List<String> roomAvailabilities = [
    'Vacant',
    'Occupied',
    'Needs Housekeeping',
    'Locked',
    'Needs verify',
    'Booked'
  ];
  String? selectedRoomAvailabilitiesType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get data from backend
    roomNotifier.getAllRoomPrice();
    roomNotifier.filterPricesByGuestType(widget.room.roomType);
    // get all guest list then filter data
    guestNotifier.getAllGuestList();
    guestNotifier.filterCurrentGuest(widget.room.id);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // get filtered data
    final filteredData =
        roomNotifier.filterPricesByGuestType(widget.room.roomType);
    final currentGuest = guestNotifier.filterCurrentGuest(widget.room.id);
//print(widget.room.id);
    return Scaffold(
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(), // when childer scrollable widget too long use this
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            border: Border.all(),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_back),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Back',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              hint: const Text('Select Availability'),
                              value: selectedRoomAvailabilitiesType,
                              icon: const Icon(Icons.arrow_downward),
                              isExpanded: true,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedRoomAvailabilitiesType = value;
                                });
                              },
                              items: roomAvailabilities
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem(
                                    value: value, child: Text(value));
                              }).toList()),
                        ),
                      ),
                      IconButton(
                          onPressed: selectedRoomAvailabilitiesType == null
                              ? null
                              : () {
                                  RoomResModel model = RoomResModel(
                                      id: widget.room.id,
                                      roomName: widget.room.roomName,
                                      roomType: widget.room.roomType,
                                      roomCategory: widget.room.roomCategory,
                                      availabilityStatus:
                                          selectedRoomAvailabilitiesType ?? '',
                                      building: widget.room.building,
                                      floor: widget.room.floor);

                                  roomNotifier.updateRoomAvailabilitiy(model);
                                },
                          icon: Icon(
                            Icons.send,
                            color: selectedRoomAvailabilitiesType == null
                                ? Colors.grey
                                : Colors.blue,
                          ))
                    ],
                  )
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         // navigate to booking page
                  //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingPage(room: widget.room,),));
                  //
                  //       },
                  //       child: Container(
                  //         height: 35,
                  //         width: 90,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.only(
                  //               bottomRight: Radius.circular(30),
                  //               topRight: Radius.circular(30)
                  //           ),
                  //           color: Color(0xFF145F6C),
                  //           border: Border.all(),
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               'Book',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.w700,
                  //                   fontSize: 18,
                  //                   color: Colors.white),
                  //             ),
                  //             SizedBox(
                  //               width: 3,
                  //             ),
                  //             Icon(
                  //               Icons.arrow_forward,
                  //               color: Colors.white,
                  //               size: 22,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.room.roomName ?? '',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),



            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Column(
            //     children: [
            //       Text(widget.room.roomName??'',style: TextStyle(
            //           fontWeight: FontWeight.w700,
            //           fontSize: 20
            //       ),),
            //       SizedBox(height: 5,),
            //       Container(
            //         width: double.infinity,
            //         padding: EdgeInsets.all(10),
            //         decoration: BoxDecoration(
            //           color: Color(0xFFACD2C7)
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //
            //             SeeRoomDetailsRow(left: 'Room Type',right: widget.room.roomType??"",),
            //             SeeRoomDetailsRow(left: 'Room Category',right: widget.room.roomCategory??'',),
            //             SeeRoomDetailsRow(left: 'Building',right: widget.room.building??'',),
            //             SeeRoomDetailsRow(left: 'Floor',right: widget.room.floor??'',),
            //             SeeRoomDetailsRow(left: 'Status',right: widget.room.availabilityStatus??'',),
            //
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),



            const Padding(padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text('Current Guest', style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20
                ),),
              ),),

            FutureBuilder(
                future: Future.value(guestNotifier.guestList),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if(snapshot.hasError){
                    return Center(
                      child: Text('Error is: ${snapshot.error}'),
                    );
                  }
                  else{
                    final data = snapshot.data;

                   // print(currentGuest.length);
                    if(currentGuest.length == 0)
                      {
                        return Center(child: Text('There are currently no guests in this room'));
                      }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: TableBorder.all(color: Colors.black.withAlpha(40), width: 1),
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(4)
                        },
                        children: [
                          TableRow(
                              decoration: BoxDecoration(
                                  color: Color(0xFFACD2C7)
                              ),
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Guest Name')),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    // i use list 0 index for access model because this is list
                                    child: AnotherData(text: currentGuest[0].name??'')),
                              ]
                          ),
                          TableRow(
                              children:[
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: AnotherHeading(text: 'Phone')

                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: AnotherData(text: currentGuest[0].phone??'')
                                )
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Email'),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].email??''),
                                )
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Office'),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].office??''),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Designation'),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].designation??''),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Guest Type'),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].user_type??''),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Check in'),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: stringToDateConvert.formateDateFromString(currentGuest[0].check_in_date.toString())),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Check out'),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: stringToDateConvert.formateDateFromString(currentGuest[0].check_out_date.toString())),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Motive of visit'),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].motive_of_visiting??''),)
                              ]
                          ),
                          TableRow(
                              children: [
                                Container(
                                  color: Color(0xFFe6ffe6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AnotherHeading(text: 'Total Persons'),),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnotherData(text: currentGuest[0].total_person.toString() ??'0'),)
                              ]
                          )
                        ],
                      ),
                    );
                    // return SizedBox(
                    //   height: 200,
                    //   child: ListView.builder(
                    //     // physics: NeverScrollableScrollPhysics(),
                    //     itemCount: currentGuest.length,
                    //     itemBuilder: (context, index) {
                    //
                    //     },
                    //
                    //   ),
                    // );
                  }
                },
            ),


const SizedBox(height: 20,),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xFFACD2C7),
                  child: Table(
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
                            text: 'Room Type',
                          ),
                          AnotherData(
                            text: widget.room.roomType, // Mock data
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const AnotherHeading(
                            text: 'Room Category',
                          ),
                          AnotherData(
                            text: widget.room.roomCategory, // Mock data
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const AnotherHeading(
                            text: 'Building',
                          ),
                          AnotherData(
                            text: widget.room.building, // Mock data
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const AnotherHeading(
                            text: 'Floor',
                          ),
                          AnotherData(
                            text: widget.room.floor, // Mock data
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          const AnotherHeading(
                            text: 'Status',
                          ),
                          AnotherData(
                            text:
                                widget.room.availabilityStatus, // Mock data
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 20,
            ),
            
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Price list',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),

            FutureBuilder(
              future: Future.value(
                  roomNotifier.roomPrices), // Wrap the value in a Future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error is: ${snapshot.error}'),
                  );
                } else {
                  final data = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                          color: Colors.black.withAlpha(70), width: 1),
                      columnWidths: const {
                        0: FlexColumnWidth(3),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(2),
                        3: FlexColumnWidth(2)
                      },
                      children: [
                        const TableRow(
                            decoration: BoxDecoration(
                                color: Color(0xFFACD2C7)),
                            children: [
                              Center(child: AnotherHeading(text: 'Guest Type')),
                              Center(child: AnotherHeading(text: '1-3 days')),
                              Center(child: AnotherHeading(text: '4-7 days')),
                              Center(child: AnotherHeading(text: '7 days up'))
                            ]),
                        TableRow(children: [
                          const AnotherData(text: 'Govt. Official (Existing/Retd.)'),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Government Official']![
                                      '1-3']!)),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Government Official']![
                                      '4-7']!)),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Government Official']![
                                      '7+']!)),

                          // AnotherData(text: '100'),
                          // AnotherData(text: '200'),
                          // AnotherData(text: '300'),
                        ]),
                        TableRow(children: [
                          const AnotherData(
                              text: 'Autonomous/Statutary Organization'),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Autonomous']!['1-3']!)),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Autonomous']!['4-7']!)),
                          Center(
                              child: AnotherData(
                                  text: filteredData['Autonomous']!['7+']!)),

                          // AnotherData(text: '100'),
                          // AnotherData(text: '100'),
                          // AnotherData(text: '100'),
                        ]),
                        TableRow(children: [
                          const AnotherData(text: 'Private Sector Employee/Others'),
                          const AnotherData(text: ''),
                          Center(
                              child: AnotherData(
                                  text: filteredData[
                                      'Private Sector Employee']!['4-7']!)),
                          const AnotherData(text: ''),
                          // AnotherData(text: ''),
                          // AnotherData(text: '200'),
                          // AnotherData(text: ''),
                        ])
                      ],
                    ),
                  );
                }
              },
            )

            // FutureBuilder(future: roomNotifier.roomPriceList, builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return const Center(child: CircularProgressIndicator());
            //   } else if (snapshot.hasError) {
            //     return Center(
            //       child: Text('Error is: ${snapshot.error}'),
            //     );
            //   }
            //   else{
            //     final data = snapshot.data;
            //     return ListView.builder(
            //       physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            //       shrinkWrap: true, // Take only necessary space
            //       itemCount: data?.length,
            //       itemBuilder: (context, index) {
            //         final roomPrice = data?[index];
            //         return  Padding(
            //           padding: const EdgeInsets.only(bottom: 15),
            //           child: Column(
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.symmetric(horizontal: 10),
            //                 color: Color(0xFFACD2C7),
            //                 child: Table(
            //                   border: TableBorder.all(
            //                     color: Colors.black.withOpacity(0.3),
            //                     width: 1,
            //                   ),
            //                   columnWidths: {
            //                     0: FlexColumnWidth(4),
            //                     1: FlexColumnWidth(5),
            //                   },
            //                   defaultVerticalAlignment:
            //                   TableCellVerticalAlignment.middle,
            //                   children: [
            //                     TableRow(
            //                       children: [
            //                         AnotherHeading(
            //                           text: ' Guest Type',
            //                         ),
            //                         AnotherData(
            //                           text:
            //                           roomPrice?.userType??'', // Mock data
            //                         ),
            //                       ],
            //                     ),
            //                     TableRow(
            //                       children: [
            //                         AnotherHeading(
            //                           text: ' Room Type',
            //                         ),
            //                         AnotherData(
            //                           text:
            //                           roomPrice?.roomType??'', // Mock data
            //                         ),
            //                       ],
            //                     ),
            //                     TableRow(
            //                       children: [
            //                         AnotherHeading(
            //                           text: '${roomPrice?.daysRange} days'??'days',
            //                         ),
            //                         AnotherData(
            //                           text:
            //                           roomPrice?.pricePerDay??'', // Mock data
            //                         ),
            //                       ],
            //                     ),
            //
            //
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   }
            // },),
          ],
        ),
      ),
    );
  }
}

class SeeRoomDetailsRow extends StatelessWidget {
  final String left;
  final String right;
  const SeeRoomDetailsRow({
    super.key,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(left)),
          const Expanded(flex: 1, child: Text(':')),
          Expanded(flex: 3, child: Text(right)),
        ],
      ),
    );
  }
}
