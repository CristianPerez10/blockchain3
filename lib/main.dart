import 'package:blockchain/src/pages/ajustes_page.dart';
import 'package:blockchain/src/pages/cartera_page.dart';
import 'package:blockchain/src/pages/historial_page.dart';
import 'package:blockchain/src/pages/home_page.dart';
import 'package:blockchain/src/pages/login_page.dart';
import 'package:blockchain/src/pages/perfil_page.dart';
import 'package:blockchain/src/pages/register_page.dart';
import 'package:blockchain/src/pages/subastas_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blockchain App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'register' : (BuildContext context) => RegisterPage(),
        'home' : (BuildContext context) => HomePage(),
        'cartera' : (BuildContext context) => CarteraPage(),
        'subastas' : (BuildContext context) => SubastasPage(),
        'historial' : (BuildContext context) => HistorialPage(),
        'perfil' : (BuildContext context) => PerfilPage(),
        'ajustes' : (BuildContext context) => AjustesPage(),
      },
      theme: ThemeData(primaryColor: Colors.black),
    );
  }

}