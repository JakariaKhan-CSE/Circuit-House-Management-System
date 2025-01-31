import 'package:circuit_house_management/view/ui/widget/bottom%20part.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/sign_in_user_drawer.dart';
import 'package:circuit_house_management/view/ui/widget/table_component.dart';
import 'package:flutter/material.dart';



class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

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
      drawer: signInUserDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Image.asset('assets/images/circuit 1.png',fit: BoxFit.cover,),
                const SizedBox(height: 20,),
                const Text('NDC Honor Board',style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 10,),
                ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 5,),
                          CircleAvatar(
                            radius: 15,

                            child: Text('${index+1}',style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800
                            ),),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            height: 264,
                            decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.black.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.black.withOpacity(0.3)),
                                  top: BorderSide(color: Colors.black.withOpacity(0.3)),
                                  // Omit the bottom border
                                )
                            ),
                            child: Column(
                              children: [

                                const CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.black,
                                ),
                                const SizedBox(height: 10,),
                            Table(
                              border: TableBorder(
                                top: BorderSide(color: Colors.black.withOpacity(0.3)),
                                bottom: BorderSide(color: Colors.black.withOpacity(0.3)),
                                horizontalInside: BorderSide(color: Colors.black.withOpacity(0.3)),
                                verticalInside: BorderSide(color: Colors.black.withOpacity(0.3)),
                              ),
                              columnWidths: const {
                                0: FlexColumnWidth(3),
                                1: FlexColumnWidth(5),
                              },
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              children: const [
                                TableRow(
                                  children: [
                                   Heading(text: 'নাম'),
                                   Data(text: ''),

                                  ],
                                ),
                                TableRow(
                                    children: [
                                     Heading(text: 'ব্যাচ'),
                                     Data(text: ''),


                                    ]
                                ),
                                TableRow(
                                  children: [
                                    Heading(text: 'যোগদানের তারিখ'),
                                    Data(text: ''),

                                  ],
                                ),
                                TableRow(
                                    children: [
                                      Heading(text: 'প্রস্থানের তারিখ'),
                                      Data(text: ''),


                                    ]
                                ),
                              ],
                            ),
                            ]
                          ),
                                            ),
                        ],
                      ));
                  },),
                const SizedBox(height: 20,),
                const BottomPart()
              ],
            ),
          )
        ],
      ),
    );
  }
}


