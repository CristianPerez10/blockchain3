import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("App Name", style: TextStyle(fontStyle: FontStyle.italic),))),
      body: Stack(
        children: <Widget>[
          _fondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _botones(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondo() {
    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color.fromRGBO(17, 20, 26, 1.0), Color.fromRGBO(10, 12, 15, 1.0) ],
          begin: FractionalOffset(0.0, 0.1),
          end: FractionalOffset(0.0, 1.0)
        )
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(child: _circulo(Color.fromRGBO(255, 255, 255, 0.07)), bottom: 100.0, right: 50.0),
        Positioned(child: _circulo(Color.fromRGBO(252, 200, 28, 0.4)), top: 100.0, right: 190.0),
        Positioned(child: _circulo(Color.fromRGBO(255, 255, 255, 0.07)), bottom: 550.0, right: 270.0),
        Positioned(child: _circulo(Color.fromRGBO(252, 200, 28, 0.4)), top: 550.0, left: 280.0),
        Positioned(child: _circulo(Color.fromRGBO(252, 200, 28, 0.4)), top: 255.0, right: 120.0),
      ],
    );
  }

  Widget _circulo(Color color){
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: color
      ),
    );
  }

  Widget _botones(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [ _crearBoton(context, "Cartera", Colors.white, Icons.account_balance_wallet, 'cartera') ]
        ),
        TableRow(
          children: [ _crearBoton(context, "Salas de subastas", Colors.white, Icons.account_balance, 'subastas') ]
        ),
        TableRow(
          children: [ _crearBoton(context, "Historial", Colors.white, Icons.assignment, 'historial') ]
        ),
        TableRow(
          children: [ _crearBoton(context, "Perfil", Colors.white, Icons.account_box, 'perfil') ]
        ),
        TableRow(
          children: [ _crearBoton(context, "Ajustes", Colors.white, Icons.bubble_chart, 'ajustes') ]
        ),
      ],
    );
  }

  Widget _crearBoton(BuildContext context, String texto, Color color, IconData icono, String routeName) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 5.0, sigmaY: 5.0 ),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(66, 63, 52, 0.6),
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, routeName),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox( height: 5.0 ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(66, 63, 52, 0.4),
                  radius: 35.0,
                  child: Icon( icono, color: color, size: 40.0 ),
                ),
                Text( texto , style: TextStyle( color: color , fontSize: 20.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}