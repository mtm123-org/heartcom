import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heartcom/services/auth/auth_service.dart';
import 'package:heartcom/components/my_button.dart';
import 'package:heartcom/components/my_textfeild.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

  // register method

  final void Function()? onTap;

  void registration(BuildContext context) {
    //get auth service
    final _auth = authService();
    // if the passwords match --> create user
    if (_passwordController.text == _confirmpasswordcontroller.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }
    // passwords don't match --> error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords do not match. Plesase try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 0,
                bottom: 0,
                left: 20,
                right: 20,
              ),
              width: 400,
              child: Image.asset('assets/images/HeartCom_Beta.png'),
            ),
          ),
          const SizedBox(height: 10),

          //wlecome back message
          Text(
            "Welcome back to HeartCom!!",
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),

          const SizedBox(height: 25),

          //login button email
          MyTextFeild(
            hintText: "Email",
            obscureText: false,
            controller: _emailController,
          ),
          const SizedBox(
            height: 20,
          ),

          MyTextFeild(
            hintText: "Password",
            obscureText: true,
            controller: _passwordController,
          ),

          SizedBox(
            height: 20,
          ),

          MyTextFeild(
            hintText: "Confirm Password",
            obscureText: true,
            controller: _confirmpasswordcontroller,
          ),
          SizedBox(
            height: 20,
          ),

          //sign up button

          MyButton(
            text: "Sign up",
            onTap: () => registration(context),
          ),
          SizedBox(
            height: 10,
          ),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              GestureDetector(
                  onTap: onTap,
                  child: Text("Login now",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),

          //forgot password
        ],
      ),
    );
  }
}
