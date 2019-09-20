import 'package:flutter/material.dart';
import 'package:fluttermic/pages/home_page.dart';
import 'package:fluttermic/pages/login_page.dart';
import 'package:fluttermic/pages/sublevel/serviciosabiertos_page.dart';
import 'package:fluttermic/pages/sublevel/servicioscerrados_page.dart';
import 'package:fluttermic/pages/sublevel/serviciosnuevos_page.dart';
import 'package:fluttermic/preferencias_usuario/preferencias_usuario.dart';

import 'bloc/provider.dart';

void main() async {

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final prefs = new PreferenciasUsuario();

    // print(prefs.idUsuario);

    return Provider(
      child: MaterialApp(
        title: 'Microformas',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'home' : (BuildContext context) => HomePage(),
          'nuevas' : (BuildContext context) => ServiciosNuevosPage(),
          'abiertas' : (BuildContext context) => ServiciosAbiertosPage(),
          'cerradas' : (BuildContext context) => ServiciosCerradosPage()
        },
        theme: ThemeData(primaryColor: Colors.blueAccent),
      ),
    );
  }
}

