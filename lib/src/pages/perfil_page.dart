import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Perfil"))),
      body: Center(child: Text("Configuracion del perfil del usuario"),),
    );
  }
}