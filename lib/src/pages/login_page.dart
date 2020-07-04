import 'dart:math';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(),
          _loginForm(context),
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

    final caja = Transform.rotate(
      angle: -pi / 3.5,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [Color.fromRGBO(255, 210, 61, 1.0), Color.fromRGBO(255, 196, 0, 1.0) ],
            begin: FractionalOffset(0.0, 0.1),
            end: FractionalOffset(0.0, 1.0)
          )
        ),
      ),
    );

  final texto = Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: <Widget>[
        SizedBox(height: 82.0),
        _generarTexto("LOGO DE LA APP", EdgeInsets.only(left: 150.0)),
        SizedBox(height: 15.0),
        _generarTexto("NOMBRE DE LA APP", EdgeInsets.only(left: 120.0)),
      ],
    ),
  );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          child: caja,
          left: -200,
          top: -130
        ),
        texto
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea( child: Container( height: 240.0 ) ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1.0,
                  offset: Offset(0.0, 5.0),
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox( height: 20.0 ),
                _crearEmail(),
                SizedBox( height: 30.0 ),
                _crearPassword(),
                SizedBox( height: 30.0 ),
                _crearBoton(context)
              ],
            ),
          ),
          _goToRegistro(context),
          SizedBox(height: 25.0)
        ],
      ),
    );
  }

  Widget _crearEmail(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon( Icons.alternate_email, color: Colors.black),
          hintText: 'ejemplo@correo.com',
          labelText: 'Correo electrónico',
          // counterText: snapshot.data,
          // errorText: snapshot.error
        ),
        // onChanged: (bloc.changeEmail),
      ),
    );
  }

  Widget _crearPassword(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon( Icons.lock_outline, color: Colors.black ),
          labelText: 'Contraseña',
          // counterText: snapshot.data,
          // errorText: snapshot.error
        ),
      ),
    );
  }

  Widget _crearBoton(BuildContext context){
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      elevation: 0.0,
      color: Color.fromRGBO(255, 196, 0, 1.0),
      textColor: Colors.black,
      onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
      // onPressed: snapshot.hasData ? ()=> _login(bloc, context) : null
    );
  }

  Widget _generarTexto(String texto, EdgeInsets _margen){
    return Container(
      margin: _margen,
      child: Text(
        texto, 
        style: TextStyle(color: Colors.white, fontSize: 22.0, fontStyle: FontStyle.italic)
      )
    );
  }

  Widget _goToRegistro(BuildContext context) {
    return FlatButton(
      child: Text("¿No tienes cuenta? Registrate aqui", style: TextStyle(color: Colors.white)),
      onPressed: () => Navigator.pushNamed(context, 'register'),
    );
  }

}