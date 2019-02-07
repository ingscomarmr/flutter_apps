import 'package:flutter/material.dart';
import './screen/login_screen.dart';

class App extends StatelessWidget {
  //para manejar patron Bloc necesitamos manejar todos con SatatelesWidget
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi App con Bloc',
      home: Scaffold(
        appBar: AppBar(
          title: Center(
                child: Text("Mi app"),
              )          
        ),
        body: Center(
          child: LoginScreen(),
        ),
      ),
    );
  }
}
