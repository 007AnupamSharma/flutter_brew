import 'package:flutter/material.dart';
import 'package:flutter_brew/services/auth.dart';


class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          TextButton.icon(onPressed: () async {
            await _auth.signOut();
          }, 
          icon: Icon(Icons.person), label: Text('Logout'))
        ],
      ),
    );
  }
}