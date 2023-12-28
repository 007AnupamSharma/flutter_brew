import 'package:flutter/material.dart';
import 'package:flutter_brew/models/user.dart';
import 'package:flutter_brew/screens/authenticate/authenticate.dart';
import 'package:flutter_brew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final UserModel? user = Provider.of<UserModel?>(context);
    print(user);
    // return either home or authenticate widget

   if(user == null){
    return Authenticate();
   }else{
    return Home();
   }
  }
}