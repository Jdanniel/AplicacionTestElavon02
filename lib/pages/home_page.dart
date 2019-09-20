import 'package:flutter/material.dart';
import 'package:fluttermic/bloc/provider.dart';
import 'package:fluttermic/models/totalodts_model.dart';
import 'package:fluttermic/preferencias_usuario/preferencias_usuario.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final prefs = new PreferenciasUsuario();
  int nuevas = 0;

  @override
  Widget build(BuildContext context) {

    final totalodtsBloc = Provider.totalOdtsBloc(context);
    totales(totalodtsBloc);

    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  _titulo(),
                  _botonesIniciales(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void totales(TotalOdtsBloc bloc) async{
    TotalodtsModel total = await bloc.cargarOdts();
    setState((){
      nuevas = total.nuevas;
    });
    
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(prefs.usuarioNombre,style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Text('Tienes ', style: TextStyle(color: Colors.white),),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 15.0,
                  child: Text(nuevas.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text(' servicios asignados', style: TextStyle(color: Colors.white))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _botonesIniciales(BuildContext context){
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * 0.72,
      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(55.0)),
        color: Colors.white
      ),
      child: Table(
        children: [
          TableRow(
            children: [
              _crearBotonRodeado(Colors.black, Icons.new_releases,'Servicios Nuevos',1),
            ]
          ),
          TableRow(
            children: [
              _crearBotonRodeado(Colors.black, Icons.lock_open,'Servicios Abiertos',2),
            ]
          ),
          TableRow(
            children: [
              _crearBotonRodeado(Colors.black, Icons.lock,'Servicios Cerrados',3),
            ]
          ),      
        ],
      ),
    );
  }

  Widget _crearBotonRodeado(Color color, IconData icon, String texto, int tipo){
    return GestureDetector(
      onTap: () => _openNuevaVentana(tipo),
      child: Container(
        height: 100.0,
        margin: EdgeInsets.fromLTRB(0, 15.0, 20.0, 15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(37, 176, 232, 0.91),
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(texto,style: TextStyle(color:color,fontSize: 20.0, fontWeight: FontWeight.bold)),
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(
                icon,
                color: Colors.white,
                size: 30.0,
              ),
            )
          ],
        ) ,
      ),
    );
  }

  _openNuevaVentana(int tipo){
    switch(tipo){
      case 1: 
        Navigator.pushNamed(context, 'nuevas');
        break;
      case 2:
        Navigator.pushNamed(context, 'abiertas');
        break;
      case 3:
        Navigator.pushNamed(context, 'cerradas');
        break;
    }
  }

  Widget _fondoApp(){
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0,0.6),
          end: FractionalOffset(0.0,1.0),
          colors: [
            Color.fromRGBO(54, 146, 255, 1.0),
            Color.fromRGBO(54, 146, 255, 1.0)
          ]
        )
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente
      ],
    );
  }
}