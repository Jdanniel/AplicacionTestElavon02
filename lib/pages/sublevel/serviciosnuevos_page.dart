import 'package:flutter/material.dart';
import 'package:fluttermic/bloc/provider.dart';
import 'package:fluttermic/models/odts_model.dart';

class ServiciosNuevosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final odtbloc = Provider.odtsBloc(context);
    odtbloc.cargarOdts();

    return Scaffold(
      appBar: AppBar(
        title: Text('NUEVAS',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
      ),
      body: _crearListado(odtbloc),
    );
  }

  Widget _crearListado(OdtsBloc bloc){
    return StreamBuilder(
      stream: bloc.odtsStream,
      builder: (BuildContext context, AsyncSnapshot<List<Odtmodel>> snapshot){
        if(snapshot.hasData){
          final odts = snapshot.data;
          return ListView.builder(
            itemCount: odts.length,
            itemBuilder: (context,index) => _crearItem(context,bloc,odts[index]),
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, OdtsBloc odtBloc , Odtmodel odts){
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red,),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('ODT: ${odts.odt}'),
              subtitle: Text('AFILIACION: ${odts.noAfiliacion} - ${odts.negocio}'),
              onTap: () => Navigator.pushNamed(context, 'odtDetalle', arguments: odts),
            ),
          ],
        ),
      )
    );
  }

  _crear(){
    
  }
}