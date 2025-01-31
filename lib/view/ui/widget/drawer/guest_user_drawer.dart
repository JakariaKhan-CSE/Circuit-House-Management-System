import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../previous/home_page.dart';
import '../../../previous/ndc_home_page.dart';
import '../../sign_in_page.dart';
import '../drawerItem.dart';
class guestUserDrawer extends StatelessWidget {
  const guestUserDrawer({
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
                child: Text(
                  'Circuit House',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                )),
          ),
          drawerItem(
            text: 'DC Honor Board',
            onTap: () {
              Get.off(()=>const HomePage());

            },
            icon: 'assets/icon/user.png',
          ),
          drawerItem(
            text: 'NDC Honor Board',
            onTap: () {
              Get.off(()=>const NdcHomePage());

            },
            icon: 'assets/icon/user.png',
          ),
          drawerItem(
            text: 'Sign In',
            onTap: () {
              Get.off(()=>const SignInPage());

            },
            icon: 'assets/icon/sign_in.png',
          ),
        ],
      ),
    );
  }
}