import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
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
}
