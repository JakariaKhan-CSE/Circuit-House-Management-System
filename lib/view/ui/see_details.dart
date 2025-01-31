import 'package:circuit_house_management/view/ui/widget/bottom%20part.dart';
import 'package:flutter/material.dart';

class SeeDetails extends StatelessWidget {
  const SeeDetails({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
            ),
            const SizedBox(height: 10,),
            const Text('  Md. Abdur Rahman',style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22
            ),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(),

                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back),
                        SizedBox(width: 3,),
                        Text('Back',style: TextStyle(
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: const Color(0xFFACD2C7),

                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text('Designation: NDC',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),
                    Text('Phone No: 01733909222',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),
                    Text('E-mail : abdurrahman@gmail.com',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),
                    Text('Joining Date: 05/01/2024',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),
                    Text('Ending Date: ',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),
                    Text('Remarks: ',style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18
                    ),),
                    SizedBox(height: 10,),

                  ],
                ),
              ),

            ),
            const SizedBox(height: 15,),
            const BottomPart(),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
