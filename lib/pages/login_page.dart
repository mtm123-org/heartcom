import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heartcom/services/auth/auth_service.dart';
import 'package:heartcom/components/my_button.dart';
import 'package:heartcom/components/my_textfeild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // tap to go to register page

  final void Function()? onTap;

  //login method
  void login(BuildContext context) async {
    //auth service
    final AuthService = authService();

    //try login
    try {
      await AuthService.signInWithEmailPassword(
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

  //registration
  void registration() {}

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

          MyButton(
            text: "login",
            onTap: () => login(context),
          ),
          SizedBox(
            height: 10,
          ),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Not a member yet?"),
              GestureDetector(
                onTap: onTap,
                child: Text("Sign up now!",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),

          //forgot password
        ],
      ),
    );
  }
}
