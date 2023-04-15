import 'package:flutter/material.dart';
import 'package:flutter_application_unavidabrillante/auth.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Inicia sesión con Google'),
              onPressed: () async {
                await _auth.signInWithGoogle();
              },
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text('¿No tienes una cuenta? Regístrate aquí.'),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
