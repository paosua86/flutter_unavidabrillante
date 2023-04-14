import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self-Esteem App'),
      ),
      body: Center(
        child: Text('Bienvenida a la aplicación de autoestima para mujeres'),
      ),
    );
  }
}
