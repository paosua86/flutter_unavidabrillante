import 'package:flutter/material.dart';
import 'package:flutter_application_unavidabrillante/auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_application_unavidabrillante/src/screens/home_screen.dart';
import 'package:flutter_application_unavidabrillante/src/screens/register_screen.dart';

void main() async {
  // Inicializar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
