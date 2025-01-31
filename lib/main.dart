import 'package:circuit_house_management/Controller/authController.dart';
import 'package:circuit_house_management/view/ui/room_page.dart';
import 'package:circuit_house_management/view/ui/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget defaultHome = const SignInPage();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final loggedIn = prefs.getBool('loggedIn')??false;
  if(loggedIn){
    defaultHome = const RoomPage();
  }else{
    defaultHome = const SignInPage();
  }
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<AuthNotifier>(create: (context) => AuthNotifier(),),
     //   ChangeNotifierProvider<RoomNotifier>(create: (context) => RoomNotifier(),),
        // ChangeNotifierProvider<BookingNotifier>(create: (context) => BookingNotifier(),),
        // ChangeNotifierProvider<FoodNotifier>(create: (context) => FoodNotifier(),),
        // ChangeNotifierProvider<HonorBoardNotifier>(create: (context) => HonorBoardNotifier(),),

      ],

          child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circuit House',
      theme: ThemeData.light().copyWith(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
       // this is default home page (this home page can see without login user)
       home: defaultHome,
       //home: BillReceipt(),
     // home: BillReceiptPage(),
    );
  }
}

