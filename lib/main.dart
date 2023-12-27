import 'package:chatt_app/screens/chat_screen.dart';
import 'package:chatt_app/screens/login_screenn.dart';
import 'package:chatt_app/screens/register_screenn.dart';
import 'package:chatt_app/screens/root_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) =>  LoginScreen(),
        RegisterScreen.id: (context) =>  RegisterScreen(),
        AuthenticationScreen.id:(context) =>  const AuthenticationScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute:   AuthenticationScreen.id,
    );
  }
}
