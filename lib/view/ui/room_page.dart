import 'package:circuit_house_management/controller/roomController.dart';
import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:circuit_house_management/view/ui/see_details_room.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/sign_in_user_drawer.dart';
import 'package:flutter/material.dart';

import '../../common/custom_button.dart';
import 'booking_page.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  // Main Page of the app
  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  int _currentIndex = 0;
  RoomNotifier roomNotifier = RoomNotifier();

  // Sample data for list views
  // List<int> firstList = List.generate(20, (index) => index + 1);
  // List<int> secondList = List.generate(15, (index) => index + 101);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get data from backend
    roomNotifier.fetchRoom(); // Fetch room data on initialization
   // using set State for show updated UI after get data from backend
    // Delay setState for 2 seconds
    Future.delayed(const Duration(seconds: 2),() {
      setState(() {

      });
    },);
  }

  // Function to filter list based on search text
  // List<int> _filterList(List<int> list) {
  //   if (_searchText.isEmpty) {
  //     return list;
  //   } else {
  //     return list
  //         .where((item) => item.toString().contains(_searchText))
  //         .toList();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACD2C7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        title: const Text('Circuit House, Jashore'),
        centerTitle: true,
      ),
      drawer: signInUserDrawer(),

      body: FutureBuilder<List<RoomResModel>>(
        future: roomNotifier.getRoomsAsFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No rooms available'));
          } else {
            List<RoomResModel> rooms = snapshot.data!;
            List<RoomResModel> filteredRooms;

            // Apply filtering logic based on selected index
            if (_currentIndex == 0) {
              // New Building Rooms
              filteredRooms = roomNotifier.filterRooms(
                  category: null, building: "New Building");
            } else if (_currentIndex == 1) {
              // Old Building Rooms
              filteredRooms = roomNotifier.filterRooms(
                  category: null, building: "Old Building");
            } else {
              // VVIP Rooms
              filteredRooms = roomNotifier.filterRooms(category: "VVIP");
            }

            // Separate rooms by floor if Old/New Building is selected
            if (_currentIndex == 0) {

              return ListView(
                children: [
                  _buildFloorSection("New Building, First Floor", filteredRooms,
                      "First Floor"),
                  _buildFloorSection("New Building, Second Floor",
                      filteredRooms, "Second Floor"),
                ],
              );
            }

            // Separate rooms by floor if Old/New Building is selected
            if (_currentIndex == 1) {

              return ListView(
                children: [
                  _buildFloorSection("Old Building, Ground Floor", filteredRooms,
                      "Ground Floor"),

                ],
              );
            }

            // Return filtered rooms for VVIP
            return Column(
              children: [
                const Text(
                  'VVIP Rooms',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredRooms.length,
                    itemBuilder: (context, index) {
                      RoomResModel room = filteredRooms[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              color: room.availabilityStatus.toLowerCase() == 'occupied'
                                  ? const Color(0xFFb526b3).withAlpha(140) //  for 'Occupied'
                                  : room.availabilityStatus.toLowerCase() == 'needs housekeeping'
                                  ? const Color(0xFFF87171).withAlpha(150) //  for 'Need Cleaning'
                                  : room.availabilityStatus.toLowerCase() == 'need verified'
                                  ? const Color(0xFFB0AD4A).withAlpha(150) //  for 'Need Verified'
                                  : room.availabilityStatus.toLowerCase() == 'booked'
                                  ? const Color(0xFFe01a10) .withAlpha(140)// Grey for 'Locked'
                                  : const Color(0xFF35962C).withAlpha(150),
                              border:
                                  Border.all(color: const Color(0xFF067589))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                room.roomName ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              // const SizedBox(height: 20,),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      room.roomType,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // navigate to booking page
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => BookingPage(
                                            room: room,
                                            roomId: room.id,
                                          ),
                                        ));
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFF145F6C),
                                          border: Border.all(),
                                        ),
                                        child:  Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [

                                            Text(
                                              room.availabilityStatus.toLowerCase() == 'booked'? 'F.Booking' : 'Book',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // const SizedBox(height: 20,),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                      pressed: room.availabilityStatus
                                                  .toLowerCase() ==
                                              'locked'
                                          ? null
                                          : () {
                                              print('availabilities room');
                                            },
                                      btnName: room.availabilityStatus ?? '',
                                      backgroundColor: room.availabilityStatus.toLowerCase() == 'occupied'
                                          ? const Color(0xFFb526b3).withAlpha(160) //  for 'Occupied'
                                          : room.availabilityStatus.toLowerCase() == 'needs housekeeping'
                                          ? const Color(0xFFF87171).withAlpha(255) //  for 'Need Cleaning'
                                          : room.availabilityStatus.toLowerCase() == 'need verified'
                                          ? const Color(0xFFB0AD4A).withAlpha(255) //  for 'Need Verified'
                                          : room.availabilityStatus.toLowerCase() == 'booked'
                                          ? const Color(0xFFe01a10) .withAlpha(160)// Grey for 'Locked'
                                          : const Color(0xFF35962C).withAlpha(255),// Default color if none of the above
                                      foregroundColor: Colors.white, width: 150,
                                    ),
                                    CustomButton(
                                      pressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => SeeDetailsRoom(
                                            room: room,
                                          ),
                                        ));
                                      },
                                      btnName: 'See Details',
                                      backgroundColor: const Color(0xFF067589),
                                      foregroundColor: Colors.white,
                                      width: 150,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                      // return ListTile(
                      //   title: Text(room.roomName),
                      //   subtitle: Text(
                      //       "Type: ${room.roomType}\nFloor: ${room.floor}\nStatus: ${room.availabilityStatus}"),
                      // );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          //unselectedItemColor: Colors.grey,

          selectedItemColor: Colors.blueAccent,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'New Building'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Old Building'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'VVIP'),
          ]
          //   items: _categories
          //       .map(
          //         (category) => BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: category["label"],
          //     ),
          //   )
          //       .toList(),
          ),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Center(
      //         child: Text(
      //           'New building layout',
      //           style: TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //             color: Color(0xFF067589),
      //           ),
      //         ),
      //       ),
      //       // SizedBox(height: 20),
      //       // RoomSearchBar(
      //       //   searchController: _searchController,
      //       //   onTap: () {
      //       //     print('Search button clicked');
      //       //   },
      //       // ),
      //       SizedBox(height: 20),
      //       // roomListViewBuilder(roomData: roomNotifier.roomList),
      //     ],
      //   ),
      // )
    );
  }

  // Helper function to build sections for each floor
  Widget _buildFloorSection(
      String sectionTitle, List<RoomResModel> rooms, String floor) {
    List<RoomResModel> floorRooms =
        rooms.where((room) => room.floor == floor).toList();

    if (floorRooms.isEmpty) {
      return const SizedBox
          .shrink(); //widget that creates a SizedBox with zero width and height
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                sectionTitle,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ...floorRooms.map((room) {
            // return ListTile(
            //   title: Text(room.roomName),
            //   subtitle: Text(
            //       "Type: ${room.roomType}\nStatus: ${room.availabilityStatus}"),
            // );
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: room.availabilityStatus.toLowerCase() == 'occupied'
                      ? const Color(0xFFb526b3).withAlpha(140) //  for 'Occupied'
                      : room.availabilityStatus.toLowerCase() == 'needs housekeeping'
                      ? const Color(0xFFF87171).withAlpha(150) //  for 'Need Cleaning'
                      : room.availabilityStatus.toLowerCase() == 'need verified'
                      ? const Color(0xFFB0AD4A).withAlpha(150) //  for 'Need Verified'
                      : room.availabilityStatus.toLowerCase() == 'booked'
                      ? const Color(0xFFe01a10) .withAlpha(140)// Grey for 'Locked'
                      : const Color(0xFF35962C).withAlpha(150),
                  border: Border.all(color: const Color(0xFF067589))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    room.roomName ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  // const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          room.roomType,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            // navigate to booking page
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BookingPage(
                                room: room,
                                roomId: room.id,
                              ),
                            ));
                          },
                          child: Container(

                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xFF145F6C),
                              border: Border.all(),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  room.availabilityStatus.toLowerCase() == 'booked'? 'F.Booking' : 'Book',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20,),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          pressed:
                              room.availabilityStatus.toLowerCase() == 'locked'
                                  ? null
                                  : () {
                                      print('availabilities room');
                                    },
                          btnName: room.availabilityStatus ?? '',
                          backgroundColor: room.availabilityStatus.toLowerCase() == 'occupied'
                              ? const Color(0xFFb526b3).withAlpha(160) //  for 'Occupied'
                              : room.availabilityStatus.toLowerCase() == 'needs housekeeping'
                              ? const Color(0xFFF87171).withAlpha(255) //  for 'Need Cleaning'
                              : room.availabilityStatus.toLowerCase() == 'need verified'
                              ? const Color(0xFFB0AD4A).withAlpha(255) //  for 'Need Verified'
                              : room.availabilityStatus.toLowerCase() == 'booked'
                              ? const Color(0xFFe01a10) .withAlpha(160)// Grey for 'Locked'
                              : const Color(0xFF35962C).withAlpha(255), // Default color if none of the above
                          foregroundColor: Colors.white, width: 150,
                        ),
                        CustomButton(
                          pressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SeeDetailsRoom(
                                room: room,
                              ),
                            ));
                          },
                          btnName: 'See Details',
                          backgroundColor: const Color(0xFF067589),
                          foregroundColor: Colors.white,
                          width: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
