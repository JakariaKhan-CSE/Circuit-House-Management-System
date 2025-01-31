import 'package:circuit_house_management/Controller/authController.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/sign_in_user_drawer.dart';
import 'package:flutter/material.dart';


// useless for this app
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthNotifier authNotifier = AuthNotifier();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //authNotifier.getProfile();
  }
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
      // body: FutureBuilder(future: authNotifier.profile,
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else if (snapshot.hasError) {
      //         return Center(
      //           child: Text('Error is: ${snapshot.error}'),
      //         );
      //       }
      //       else{
      //         final data = snapshot.data;
      //         return SingleChildScrollView(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               SizedBox(height: 10,),
      //               CircleAvatar(
      //                 radius: 60,
      //                 backgroundColor: Colors.black,
      //               ),
      //               SizedBox(height: 10,),
      //               Text('  Md. Abdur Rahman',style: TextStyle(
      //                   fontWeight: FontWeight.w700,
      //                   fontSize: 22
      //               ),),
      //               SizedBox(height: 20,),
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Container(
      //                   width: double.infinity,
      //                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //                   decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.black),
      //                     color: Color(0xFFACD2C7),
      //
      //                   ),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       SizedBox(height: 10,),
      //                       Text('Designation: NDC',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //                       Text('Phone No: 01733909222',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //                       Text('E-mail : abdurrahman@gmail.com',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //                       Text('Joining Date: 05/01/2024',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //                       Text('Ending Date: ',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //                       Text('Remarks: ',style: TextStyle(
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 18
      //                       ),),
      //                       SizedBox(height: 10,),
      //
      //                     ],
      //                   ),
      //                 ),
      //
      //               ),
      //               SizedBox(height: 15,),
      //               BottomPart(),
      //               SizedBox(height: 10,),
      //             ],
      //           ),
      //         );
      //       }
      //     },),

    );
  }
}
