import 'package:flutter/material.dart';
import 'package:flutter_brew/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function? toogleView;
  SignIn({@required this.toogleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();


  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toogleView!();
          }, icon: Icon(Icons.person), label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              },
              style: TextStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (val) {setState(() => password = val);},
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink[500]),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
              ),
              onPressed: () {
                print("Email : $email \n Password : $password");
              },
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
