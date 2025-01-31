import 'package:circuit_house_management/Services/authHelper.dart';
import 'package:circuit_house_management/model/req/login.dart';
import 'package:circuit_house_management/view/ui/room_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier{
  // login
  login(LoginModel model){
   AuthHelper.login(model).then((response) {
     if(response)
       {
         Get.off(const RoomPage());
       //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProfilePage(),));
       }
     else{
       Get.snackbar('Sign in Failed', 'Please try again',backgroundColor: Colors.red);
       // ScaffoldMessenger.of(context).showSnackBar(
       //   const SnackBar(content: Text('Sign in Failed'),backgroundColor: Colors.red,),
       // );
     }
   },);
  }

  // register
// register(SignUpModel model){
//   AuthHelper.register(model).then((response){
//     if(response)
//       {
//         Get.off(SignInPage());
//        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInPage(),));
//       }
//     else{
//       Get.snackbar('Register Failed', 'Please try again',backgroundColor: Colors.red);
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Register Failed'), backgroundColor: Colors.red,)
//       // );
//     }
//   });
// }
//
// // Profile
//   Future<ProfileResModel>? profile;
//   getProfile()async{
//     profile = AuthHelper.getProfile();
//   }


logout()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('loggedIn');
    await prefs.remove('token');
}

}