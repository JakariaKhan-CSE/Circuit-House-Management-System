import 'package:circuit_house_management/Controller/authController.dart';
import 'package:circuit_house_management/common/custom_button.dart';
import 'package:circuit_house_management/model/req/login.dart';
import 'package:circuit_house_management/view/ui/widget/booking_page_row_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFD4EDE6),
      //backgroundColor: Color(0xFFACD2C7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        elevation: 8,
        title: const Text('Circuit House, Jashore'),
        centerTitle: true,
      ),
      // drawer: const guestUserDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
              const Text('Sign in',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22
              ),),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    color: const Color(0xFF9BC8D0),
                    child: Column(
                      children: [

                        booking_page_row_item(
                          controller: emailController,
                          leftText: 'Username',hintText: 'Enter User Name',),
                        booking_page_row_item(
                          controller: passwordController,
                          leftText: 'Password',hintText: 'Enter Password',),


                       const SizedBox(height: 20,),
                      //  SizedBox(height: 20,),
                        CustomButton(pressed: (){

                          if(_formKey.currentState!.validate())
                          {

                            LoginModel loginModel = LoginModel(
                                username: emailController.text.trim(),
                                password: passwordController.text.trim());
                            // String jsonText = jsonEncode(loginModel.toJson());
                            // print(jsonText);
                            // navigate to home page (without login)
                          authNotifier.login(loginModel);
                          }

                        }, btnName: 'Submit',
                          backgroundColor: const Color(0xFF1D2582),
                        foregroundColor: Colors.white,),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
