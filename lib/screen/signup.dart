import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/screen/home.dart';
import 'package:login/utils/color.dart';
import '../reusable/reusablewidgets.dart';


class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
 TextEditingController _passwordTextController =TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

        ),

      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("48FE2E"),
                hexStringToColor("54924B"),
                hexStringToColor("536750"),
                hexStringToColor("2E342D"),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter UserName", Icons.person_outline, false,
                        _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Password", Icons.lock_outlined, true,
                        _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                 firebaseUIBotton(context,"sign up", (){
                   FirebaseAuth.instance.
                   createUserWithEmailAndPassword(
                       email: _emailTextController.text ,
                       password: _passwordTextController.text)
                       .then((value){
                         print("created new account");
                         Navigator.push(context,
                         MaterialPageRoute(builder:(context) =>HomeScreen()));
                   }).onError((error, stackTrace) {
                     print("error ${error.toString()}");
                   });
                 })

                  ],
                ),
              ))),
    );
  }
}
