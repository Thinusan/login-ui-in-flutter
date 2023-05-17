import 'package:flutter/material.dart';
import 'package:login/screen/signup.dart';
import 'package:login/utils/color.dart';

import '../reusable/reusablewidgets.dart';



class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(

        width: MediaQuery
            .of(context)
            .size
            .width,

        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  hexStringToColor("48FE2E"),
                  hexStringToColor("54924B"),
                  hexStringToColor("536750"),
                  hexStringToColor("2E342D"),

                ],
                begin: Alignment.topCenter, end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery
                .of(context)
                .size
                .height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Enter password", Icons.lock, true,
                    _passwordTextController),
                firebaseUIBotton(context, "log in", () {}),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
    Row signUpOption() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't you have an account?",
              style: TextStyle(color: Colors.white70)),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => signupscreen()));
            },
            child: const Text(
              " Sign Up",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      );
    }


  
}
