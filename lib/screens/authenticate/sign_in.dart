import 'package:flutter/material.dart';
import 'package:flutter_brew/services/auth.dart';
import 'package:flutter_brew/shared/constants.dart';
import 'package:flutter_brew/shared/loading.dart';

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
  String error = '';
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.toogleView!();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? "Enter the correct Email " : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) => value!.length < 6
                      ? 'Enter the password 6+ char long '
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pink[500]),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result =
                          await _auth.signInWithEmail(email, password);
                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'could not sign in with those credentials';
                        });
                      }
                    }
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.pink, fontSize: 14.0),
                )
              ],
            )),
      ),
    );
  }
}


// email: bhavyasha05@gmail.com
// password: bhavya12345