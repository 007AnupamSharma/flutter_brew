import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brew/models/user.dart';
import 'package:flutter_brew/screens/wrapper.dart';
import 'package:flutter_brew/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  try{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  }catch(e){
    print(e);
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: UserModel(),
      catchError: (context, error){
        print("Error in a Stream $error");
        return null;
      },
      child: MaterialApp(
       home: Wrapper(),
      ),
    );
  }
}
