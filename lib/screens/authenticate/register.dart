import 'package:flutter/material.dart';
import 'package:flutter_brew/services/auth.dart';

class Register extends StatefulWidget {
  
  final Function? toogleView;
  Register({this.toogleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Sign up to Brew Crew'),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toogleView!();
          }, icon: Icon(Icons.person), label: Text("Sign In"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter the Email"),
              validator: (value) => value!.isEmpty ? 'Enter the email' : null,
              onChanged: (val) {
                setState(() => email = val);
              },
              style: TextStyle(),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Enter the Password"),
              validator: (value) => value!.length < 6 ? 'Enter the password 6+ char long ' : null,
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
              onPressed: () async {
                if(_formkey.currentState!.validate()){
                  dynamic result = await _auth.registerWithEmail(email, password);
                  if(result == null){
                    setState(() => error = 'please supply valid email!!');
                  }else{

                  }
                }
              },
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 12.0,),
            Text(error, style: TextStyle(color: Colors.pink, fontSize: 14.0),)
          ],
        )),
      ),
    );
  }
}