import 'package:circuit_house_management/model/res/room/room_res_model.dart';
import 'package:flutter/material.dart';

import '../../../common/custom_button.dart';
import '../see_details_room.dart';

class roomListViewBuilder extends StatefulWidget {
  final Future<List<RoomResModel>>? roomData;

  const roomListViewBuilder({
    super.key, required this.roomData,
  });

  @override
  State<roomListViewBuilder> createState() => _roomListViewBuilderState();
}

class _roomListViewBuilderState extends State<roomListViewBuilder> {
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
      future: widget.roomData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error is: ${snapshot.error}'),
          );
        }
        else{
          final data = snapshot.data;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(), // Disable scrolling
            shrinkWrap: true, // Take only necessary space
            itemCount: data?.length,
            itemBuilder: (context, index) {
              final room = data?[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    border: Border.all(color: const Color(0xFF067589))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    Text(room?.roomName??'',style: const TextStyle(
                        fontWeight: FontWeight.normal,

                        fontSize: 20
                    ),),
                    const SizedBox(height: 20,),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10),
                    //   child: Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text('বেডঃ ${room.}',style: TextStyle(
                    //         color: Colors.black.withOpacity(0.7),
                    //         fontSize: 20
                    //     )),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(pressed: room?.availabilityStatus.toLowerCase()=='locked'? null:  (){
                            print('availabilities room');
                          }, btnName: room!.availabilityStatus??'',
                            backgroundColor: room.availabilityStatus.toLowerCase() == 'occupied'
                                ? const Color(0xFF1E2DD8) //  for 'Occupied'
                                : room.availabilityStatus.toLowerCase() == 'needs clean'
                                ? const Color(0xFF7B191A) //  for 'Need Cleaning'
                                : room.availabilityStatus.toLowerCase() == 'need verified'
                                ? const Color(0xFFB0AD4A) //  for 'Need Verified'
                                : room.availabilityStatus.toLowerCase() == 'booked'
                                ? const Color(0xFFC2C2B8) // Grey for 'Locked'
                                : const Color(0xFF35962C), // Default color if none of the above
                            foregroundColor: Colors.white,width: 150,),

                          CustomButton(pressed: (){

                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SeeDetailsRoom(room: room,),));
                          }, btnName: 'See Details',backgroundColor: const Color(0xFF067589),
                            foregroundColor: Colors.white,width: 150,)
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
    },);

  }
}