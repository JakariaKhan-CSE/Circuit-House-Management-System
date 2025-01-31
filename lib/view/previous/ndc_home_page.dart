import 'package:circuit_house_management/view/ui/widget/bottom%20part.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/guest_user_drawer.dart';
import 'package:flutter/material.dart';

import '../../Controller/honorBoard.dart';

// useless for this app
class NdcHomePage extends StatefulWidget {
  const NdcHomePage({super.key});

  @override
  State<NdcHomePage> createState() => _NdcHomePageState();
}

class _NdcHomePageState extends State<NdcHomePage> {
  HonorBoardNotifier honorBoardNotifier = HonorBoardNotifier();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //honorBoardNotifier.getDcBoard(); // get data
   // honorBoardNotifier.fetchHonorBoards(); // Fetch and filter data
  }
// this homepage for DC honor board show
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACD2C7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        elevation: 8,
        title: const Text('Circuit House'),
        centerTitle: true,
      ),
      drawer: const guestUserDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/circuit 1.png',
                  fit: BoxFit.cover,
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'NDC Honor Board',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                // FutureBuilder(
                //   future: honorBoardNotifier.ndcHonorBoard,
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return CircularProgressIndicator();
                //     } else if (snapshot.hasError) {
                //       return Center(
                //         child: Text('Error is: ${snapshot.error}'),
                //       );
                //     } else {
                //       final dchonorboards = snapshot.data;
                //       return ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //         shrinkWrap: true,
                //         itemCount: dchonorboards?.length,
                //         itemBuilder: (context, index) {
                //           final dchonorBoard = dchonorboards?[index];
                //           // print(dchonorBoard?.designationType);
                //           // if(dchonorBoard?.designationType == 'DC')
                //           return Padding(
                //               padding: const EdgeInsets.only(bottom: 10),
                //               child: Column(
                //                 children: [
                //                   SizedBox(
                //                     height: 5,
                //                   ),
                //                   CircleAvatar(
                //                     radius: 15,
                //                     child: Text(
                //                       '${index + 1}',
                //                       style: TextStyle(
                //                           fontSize: 15, fontWeight: FontWeight.w800),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 10,
                //                   ),
                //                   Container(
                //                     height: 264,
                //                    // height: 400,
                //                     decoration: BoxDecoration(
                //                         border: Border(
                //                           left: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           right: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           top: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           // Omit the bottom border
                //                         )),
                //                     child: Column(children: [
                //                       CircleAvatar(
                //                         radius: 45,
                //                         backgroundColor: Colors.black,
                //                         backgroundImage: NetworkImage(dchonorBoard!.photo??'https://www.shutterstock.com/shutterstock/photos/1944846151/display_1500/stock-vector-young-man-keeping-the-arms-crossed-hand-drawn-vector-illustration-1944846151.jpg'),
                //                       ),
                //                       SizedBox(
                //                         height: 10,
                //                       ),
                //                       Table(
                //                         border: TableBorder(
                //                           top: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           bottom: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           horizontalInside: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                           verticalInside: BorderSide(
                //                               color: Colors.black.withOpacity(0.3)),
                //                         ),
                //                         columnWidths: {
                //                           0: FlexColumnWidth(3),
                //                           1: FlexColumnWidth(5),
                //                         },
                //                         defaultVerticalAlignment:
                //                         TableCellVerticalAlignment.middle,
                //                         children: [
                //                           TableRow(
                //                             children: [
                //                               Heading(text: 'নাম'),
                //                               Data(text: dchonorBoard.name??''),
                //                             ],
                //                           ),
                //                           TableRow(children: [
                //                             Heading(text: 'ব্যাচ'),
                //                             Data(text: dchonorBoard.batch??''),
                //                           ]),
                //                           TableRow(
                //                             children: [
                //                               Heading(text: 'যোগদানের তারিখ'),
                //                               Data(text: dchonorBoard.joiningDate??''),
                //                             ],
                //                           ),
                //                           TableRow(children: [
                //                             Heading(text: 'প্রস্থানের তারিখ'),
                //                             Data(text: dchonorBoard.endingDate??''),
                //                           ]),
                //                         ],
                //                       ),
                //                     ]),
                //                   ),
                //                 ],
                //               ));
                //         },
                //       );
                //     }
                //   },
                // ),
                // ListView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                //   shrinkWrap: true,
                //   itemCount: 5,
                //   itemBuilder: (context, index) {
                //     return Padding(
                //         padding: const EdgeInsets.only(bottom: 10),
                //         child: Column(
                //           children: [
                //             SizedBox(
                //               height: 5,
                //             ),
                //             CircleAvatar(
                //               radius: 15,
                //               child: Text(
                //                 '${index + 1}',
                //                 style: TextStyle(
                //                     fontSize: 20, fontWeight: FontWeight.w800),
                //               ),
                //             ),
                //             SizedBox(
                //               height: 10,
                //             ),
                //             Container(
                //               height: 264,
                //               decoration: BoxDecoration(
                //                   border: Border(
                //                     left: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     right: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     top: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     // Omit the bottom border
                //                   )),
                //               child: Column(children: [
                //                 CircleAvatar(
                //                   radius: 45,
                //                   backgroundColor: Colors.black,
                //                 ),
                //                 SizedBox(
                //                   height: 10,
                //                 ),
                //                 Table(
                //                   border: TableBorder(
                //                     top: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     bottom: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     horizontalInside: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                     verticalInside: BorderSide(
                //                         color: Colors.black.withOpacity(0.3)),
                //                   ),
                //                   columnWidths: {
                //                     0: FlexColumnWidth(3),
                //                     1: FlexColumnWidth(5),
                //                   },
                //                   defaultVerticalAlignment:
                //                   TableCellVerticalAlignment.middle,
                //                   children: [
                //                     TableRow(
                //                       children: [
                //                         Heading(text: 'নাম'),
                //                         Data(text: ''),
                //                       ],
                //                     ),
                //                     TableRow(children: [
                //                       Heading(text: 'ব্যাচ'),
                //                       Data(text: ''),
                //                     ]),
                //                     TableRow(
                //                       children: [
                //                         Heading(text: 'যোগদানের তারিখ'),
                //                         Data(text: ''),
                //                       ],
                //                     ),
                //                     TableRow(children: [
                //                       Heading(text: 'প্রস্থানের তারিখ'),
                //                       Data(text: ''),
                //                     ]),
                //                   ],
                //                 ),
                //               ]),
                //             ),
                //           ],
                //         ));
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
                const BottomPart()
              ],
            ),
          )
        ],
      ),
    );
  }
}


