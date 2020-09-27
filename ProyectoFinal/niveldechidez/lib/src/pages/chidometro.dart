import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChidoPage extends StatefulWidget {
  @override
  _ChidoPageState createState() => _ChidoPageState();
}

class _ChidoPageState extends State<ChidoPage> {
  int estado = 0, conteo = 0, valganar = 10;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _cuerpo(),
      );

  Widget _cuerpo() => Center(
          child: Stack(children: [
        _fondoChidez(),
        SafeArea(
            child: Column(
          children: [
            _colorizeText(),
            Expanded(child: Container()),
            _mensaje(),
            Expanded(child: Container()),
            _botones(),
            Expanded(child: Container()),
          ],
        ))
      ]));

  Widget _colorizeText() => Container(
      margin: EdgeInsets.all(50),
      child: ColorizeAnimatedTextKit(
        repeatForever: true,
        text: [
          "HEY CRACK",
          "¿ERES CHIDO?",
        ],
        textStyle: GoogleFonts.secularOne(fontSize: 65.0),
        colors: [
          Colors.lightBlue,
          Colors.cyan,
          Colors.blueGrey[200],
          Colors.blueGrey[100],
          Colors.blueGrey[50],
          Colors.white,
          Colors.white,
          Colors.yellow,
          Colors.white,
          Colors.white,
          Colors.blueGrey[50],
          Colors.blueGrey[100],
          Colors.blueGrey[200],
          Colors.cyan,
          Colors.lightBlue,
        ],
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.centerStart // or Alignment.topLeft
        ,
      ));

  Widget _fondoChidez() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
              Colors.indigo,
              Colors.purple,
              Colors.red,
              Colors.deepOrange,
              Colors.orange,
              Colors.amber,
              Colors.amber[300],
              Colors.amber[200],
              Colors.amber[100],
            ])),
      );
// botones
  Widget _botones() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          switchbutton(),
          _gamebutton(
              icono: Icon(Icons.refresh),
              color: Colors.orange,
              func: () {
                setState(() {
                  conteo = 0;
                  estado = 0;
                });
              })
        ],
      );

  Widget switchbutton() => ((estado == 2)
      ? _gamebutton(
          icono: Icon(Icons.touch_app),
          color: Colors.teal,
          func: () => _tocar())
      : _gamebutton(
          icono: Icon(Icons.play_arrow),
          color: Colors.teal,
          func: () => _play()));

  Widget _gamebutton({Widget icono, Color color, func}) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: color),
        child: FlatButton(
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          onPressed: func,
          child: icono,
          color: color,
        ),
      );

  void _tocar() {
    setState(() {
      conteo++;
    });
  }

  void _play() {
    setState(() {
      switch (estado) {
        case 0:
          conteo = 0;
          estado = 1;
          break;
        case 1:
          estado = 2;
          break;
        default:
          break;
      }
    });
  }

// Mensajes
  Widget _mensaje() => Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10)),
      child: _mensajeAux());

  Widget _mensajeAux() {
    switch (estado) {
      case 0:
        return _alaespera();
        break;
      case 1:
        return _inicio();
        break;
      case 2:
        return _juego();
        break;
      default:
        return _final();
    }
  }

  Widget _alaespera() => Text(
        'Presiona play para iniciar',
        style: GoogleFonts.roboto(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      );
  Widget _inicio() {
    return FadeAnimatedTextKit(
        text: [
          "¿LISTO?",
          "5",
          "4",
          "3",
          "2",
          "1",
          "YA",
        ],
        textStyle: GoogleFonts.roboto(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.center);
  }

  Widget _juego() {
    Timer(Duration(seconds: 10), () => estado = 3);
    return Text(
      '$conteo',
      style: GoogleFonts.roboto(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _final() => Text(
        ((ganar())
            ? 'Eres chido'
            : 'Lo siento mi crack pero no tienes chidez en tu vida'),
        style: GoogleFonts.roboto(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      );

  bool ganar() => (conteo >= valganar) ? true : false;
}
