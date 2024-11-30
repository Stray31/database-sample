import 'package:flutter/material.dart';
import 'package:from_scratch_firebase/Login%20Signup/Screen/sign_up.dart';
import 'package:from_scratch_firebase/Login%20Signup/Widget/button.dart';
import 'package:from_scratch_firebase/Login%20Signup/Widget/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginScreen> {
  //for controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                  textEditingController: emailController,
                  hintText: "Enter your email",
                  icon: Icons.email,
                ),
                TextFieldInput(
                  textEditingController: passwordController,
                  hintText: "Enter your password",
                  icon: Icons.lock,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue),
                    ),
                  ),
                ),
                MyButton(onTab: () {}, text: "Log in"),
                SizedBox(height: height / 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        " SignUp",
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
//login ui