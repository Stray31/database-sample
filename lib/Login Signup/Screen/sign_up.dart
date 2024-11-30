import 'package:flutter/material.dart';
import 'package:from_scratch_firebase/Login%20Signup/Screen/home_screen.dart';
import 'package:from_scratch_firebase/Login%20Signup/Screen/login.dart';
import 'package:from_scratch_firebase/Login%20Signup/Services/authentication.dart';
import 'package:from_scratch_firebase/Login%20Signup/Widget/button.dart';
import 'package:from_scratch_firebase/Login%20Signup/Widget/snack_bar.dart';
import 'package:from_scratch_firebase/Login%20Signup/Widget/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    //if successful signup, na create na user tas navigate sa next screen
    //if hindi show error message
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      //navigate sa next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show yung error message
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: height / 2.7,
                  width: double.infinity,
                ),
                TextFieldInput(
                  textEditingController: nameController,
                  hintText: "Enter your name",
                  icon: Icons.person,
                ),
                TextFieldInput(
                  textEditingController: emailController,
                  hintText: "Enter your email",
                  icon: Icons.email,
                ),
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: "Enter your password",
                  icon: Icons.lock,
                ),
                MyButton(onTab: signUpUser, text: "Sign Up"),
                SizedBox(height: height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
// ui part
// authentication part na
// empty ang database and auth for now NOV 29 3:24 AM

