import 'package:circuit_house_management/Controller/authController.dart';
import 'package:circuit_house_management/view/ui/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../food_page.dart';
import '../../guest_page.dart';
import '../../room_page.dart';
import '../drawerItem.dart';

// useless for this app
class signInUserDrawer extends StatelessWidget {
  AuthNotifier authNotifier = AuthNotifier();
  signInUserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFACD2C7),
            ),
            child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/logo/Picture1.png'),
                    ),
                    Text(
                      'Circuit House, Jashore',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ],
                )),
          ),

          drawerItem(
            text: 'Rooms',
            onTap: () {
              Get.off(()=>const RoomPage());

            },
            icon: 'assets/icon/room.png',
          ),
          drawerItem(
            text: 'Guest',
            onTap: () {
              Get.off(()=>const GuestPage());

            },
            icon: 'assets/icon/guests.png',
          ),
          drawerItem(
            text: 'Food',
            onTap: () {
              Get.off(()=>const FoodPage());
            },
            icon: 'assets/icon/food.png',
          ),

          // drawerItem(
          //   text: 'Profile',
          //   onTap: () {
          //     Get.off(()=>ProfilePage());
          //
          //   },
          //   icon: 'assets/icon/profile.png',
          // ),


          drawerItem(
            text: 'Sign Out',
            onTap: () {

              // navigate to home page (without login)
              Get.off(()=>const SignInPage());
              authNotifier.logout();
            },
            icon: 'assets/icon/sign_in.png',
          ),

        ],
      ),
    );
  }
}