import 'package:circuit_house_management/Controller/authController.dart';
import 'package:circuit_house_management/common/custom_button.dart';
import 'package:circuit_house_management/model/req/signup_model.dart';
import 'package:circuit_house_management/view/ui/sign_in_page.dart';
import 'package:circuit_house_management/view/ui/widget/booking_page_row_item.dart';
import 'package:circuit_house_management/view/ui/widget/drawer/guest_user_drawer.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignUpPage> {
  AuthNotifier authNotifier = AuthNotifier();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4EDE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD2C7),
        elevation: 8,
        title: const Text('Circuit House'),
        centerTitle: true,
      ),
      drawer: const guestUserDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    color: const Color(0xFF9BC8D0),
                    child: Column(
                      children: [
                        booking_page_row_item(
                          controller: userNameController,
                          leftText: 'User Name ',
                          hintText: 'Enter User Name',
                        ),
                        booking_page_row_item(
                          controller: emailController,
                          leftText: 'Email',
                          hintText: 'Enter User Email',
                        ),
                        booking_page_row_item(
                          controller: passwordController,
                          leftText: 'Password',
                          hintText: 'Enter Password',
                        ),
                        booking_page_row_item(
                          controller: confirmPasswordController,
                          leftText: 'Confirm Password',
                          hintText: 'Enter Confirm Password',
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                // Navigate to Sign Up page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInPage(), // Replace with your SignUpPage widget
                                  ),
                                );
                              },
                              child: const Text('Sign in')),
                        ),
                        CustomButton(
                          pressed: () {
                            print('submit in button click');
                            if (_formKey.currentState!.validate()) {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Password Does not match'),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                SignUpModel signupModel = SignUpModel(
                                    username: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    profile_picture: '');
                               // authNotifier.register(signupModel);
                              }
                            }
                          },
                          btnName: 'Submit',
                          backgroundColor: const Color(0xFF1D2582),
                          foregroundColor: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
