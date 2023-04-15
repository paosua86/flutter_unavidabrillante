import 'package:flutter/material.dart';
import 'package:flutter_application_unavidabrillante/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService(); // se crea una instancia de AuthService
  final _formKey = GlobalKey<FormState>(); // se crea una instancia de GlobalKey

  String email = ''; // se declara una variable email
  String password = ''; // se declara una variable password
  String error = ''; // se declara una variable error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey, // se asocia el GlobalKey al Form
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                validator: (val) =>
                    val!.isEmpty ? 'Ingresa un correo electrónico' : null,
                onChanged: (val) {
                  setState(() => email = val); // se actualiza el valor de email al escribir en el TextFormField correspondiente
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: (val) => val!.length < 6
                    ? 'La contraseña debe tener al menos 6 caracteres'
                    : null,
                onChanged: (val) {
                  setState(() => password = val); // se actualiza el valor de password al escribir en el TextFormField correspondiente
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Regístrate'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password); // se llama a la función registerWithEmailAndPassword de AuthService, que devuelve una Promesa
                    if (result == null) { // si la promesa devuelve null, se actualiza el valor de error
                      setState(() => error = 'No se pudo registrar con esas credenciales');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error, // se muestra el valor de error en caso de que haya alguno
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
