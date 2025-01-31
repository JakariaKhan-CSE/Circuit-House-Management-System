import 'package:flutter/material.dart';

class BillReceipt extends StatelessWidget {
  const BillReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 30,),
         Center(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Text('Orient Super Shop',style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w700,
                   letterSpacing: 1.3
               ),),
               Text('M K M Tower',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),),
               Text('19, Rail Road, Jashore',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),),
               Text('email: orientsupershop@gmail.com',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),),
               Text('Tel: 3531321213, Cell: 01325458798',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),),
               Text('Vat Regd: 3232541321321',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),),
               Text('Mushak 6-3',style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.normal
               ),)
             ],
           ),
         ),
            Column(
              children: [
                Text('Memo: S4-532323',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),

                Text('Served By: Sobhan RR',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),),
                Text('Client: Ajoy Dutta',style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),)
              ],
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.black,thickness: 1.1,indent: 20,endIndent: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Item',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),),
                  Text('Qty',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),),
                  Text('Price',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),),
                  Text('D%',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),),
                  Text('Total',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),),
                ],
              ),
            ),
            Divider(color: Colors.black,thickness: 1.1,indent: 20,endIndent: 20,),
            Divider(color: Colors.black,thickness: 1.1,indent: 20,endIndent: 20,),
          ],
        ),
      ),
    );
  }
}
