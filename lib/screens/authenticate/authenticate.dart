import 'package:flutter/material.dart';
import 'package:flutter_brew/screens/authenticate/register.dart';
import 'package:flutter_brew/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {


  bool showSignIn = true;
  void toogleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toogleView: toogleView);
    }
    else{
      return Register(toogleView: toogleView);
    }
  }
}