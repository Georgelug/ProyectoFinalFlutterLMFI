import 'package:flutter/material.dart';
import 'package:niveldechidez/src/pages/home_page.dart';
import 'package:niveldechidez/src/pages/chidometro.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nivel de Chidez',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'chidez': (BuildContext context) => ChidoPage()
        },
        initialRoute: 'chidez',
      );
}
