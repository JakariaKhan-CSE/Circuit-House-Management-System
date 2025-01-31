import 'package:circuit_house_management/view/ui/see_details.dart';
import 'package:circuit_house_management/view/ui/widget/bottom%20part.dart';
import 'package:circuit_house_management/view/ui/widget/table_component.dart';
import 'package:flutter/material.dart';


class GuestPageOld extends StatefulWidget {
  const GuestPageOld({super.key});

  @override
  State<GuestPageOld> createState() => _GuestPageOldState();
}

class _GuestPageOldState extends State<GuestPageOld> {
  DateTime? selectedDate;
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
        // Filter guest list based on the selected date
        //_filterGuestsByDate(picked);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectDate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              const Text('Our Geusts',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700
              ),),
              const SizedBox(height: 10,),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width*2,
              //     child: Table(
              //       border: TableBorder.all(),
              //       columnWidths: {
              //         0: FlexColumnWidth(1),
              //         1: FlexColumnWidth(5),
              //         2: FlexColumnWidth(2),
              //         3: FlexColumnWidth(2),
              //         4: FlexColumnWidth(2),
              //         5: FlexColumnWidth(2),
              //         6: FlexColumnWidth(2),
              //       },
              //       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              //       children: [
              //         TableRow(
              //           children: [
              //             Heading(text: 'No'),
              //             Heading(text: 'Name, Designation & Mobile Phone No'),
              //             Heading(text: 'Room Name'),
              //             Heading(text: 'Purpose of Visiting'),
              //             Heading(text: 'Check in Date & Time'),
              //             Heading(text: 'Check out Date & Time'),
              //             Heading(text: 'More info'),
              //           ],
              //         ),
              //         TableRow(
              //             children: [
              //               Data(text: '1.',isBold: true),
              //               Data(text: 'Md. Asadujjaman, CEO 01010101010',isBold: true),
              //               Data(text: 'তিতাস',isBold: true),
              //               Data(text: 'Government',isBold: true),
              //               Data(text: '01/12/24 8:10 am',isBold: true),
              //               Data(text: '04/12/24 10:50 am',isBold: true),
              //               Data(text: 'See Details', isButton: true,isBold: true,onTap: (){
              //
              //                 // Navigate to SeeDetails page
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(builder: (_) => SeeDetails()),
              //                 );
              //
              //               },),
              //             ]
              //         ),
              //         TableRow(
              //             children:[
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               ),
              //               Container(
              //                 height: 300,
              //               )
              //             ]
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                          children: [

                            const SizedBox(height: 10,),
                            CircleAvatar(
                              radius: 15,

                              child: Text('${index+1}',style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800
                              ),),
                            ),
                            const SizedBox(height: 5,),
                            Table(
                              border: TableBorder(
                                top: BorderSide(color: Colors.black.withOpacity(0.3)),
                                bottom: BorderSide(color: Colors.black.withOpacity(0.3)),
                                left: BorderSide(color: Colors.black.withOpacity(0.3)),
                                right: BorderSide(color: Colors.black.withOpacity(0.3)),
                                horizontalInside: BorderSide(color: Colors.black.withOpacity(0.3)),
                                verticalInside: BorderSide(color: Colors.black.withOpacity(0.3)),
                              ),
                              columnWidths: const {
                                0: FlexColumnWidth(4),
                                1: FlexColumnWidth(5),
                              },
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: [
                                const TableRow(
                                  children: [
                                    AnotherHeading(text: ' Name, Designation & Mobile Phone No'),
                                    AnotherData(text: 'Md. Asadujjaman, CEO 01010101010'),

                                  ],
                                ),
                                const TableRow(
                                    children: [
                                      AnotherHeading(text: 'Room Name'),
                                      AnotherData(text: 'তিতাস'),


                                    ]
                                ),
                                const TableRow(
                                  children: [
                                    AnotherHeading(text: 'Purpose of Visiting'),
                                    AnotherData(text: 'Government'),

                                  ],
                                ),
                                const TableRow(
                                    children: [
                                      AnotherHeading(text: 'Check in Date & Time'),
                                      AnotherData(text: '01/12/24 8:10 am'),


                                    ]
                                ),
                                const TableRow(
                                    children: [
                                      AnotherHeading(text: 'Check out Date & Time'),
                                      AnotherData(text: '04/12/24 10:50 am'),


                                    ]
                                ),
                                TableRow(
                                    children: [
                                      const AnotherHeading(text: 'More info'),
                                      AnotherData(text: 'See Details', isButton: true,isBold: true,onTap:(){
                                       // Navigate to SeeDetails page
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (_) => const SeeDetails()),
                                                        );
                                      }),


                                    ]
                                ),
                              ],
                            ),
                          ]
                      ));
                },),
              const SizedBox(height: 20,),

              const SizedBox(height: 20,),
              const BottomPart()
            ],
          ),
        ),
      ),
    );
  }
}

class pageNumber extends StatelessWidget {
  final String text;
  const pageNumber({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: const BoxDecoration(
        color: Color(0xFF4CB9BD)
      ),
      child: Center(
        child: Text(text,style: const TextStyle(
          fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
