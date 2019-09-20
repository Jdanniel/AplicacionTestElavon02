import 'dart:convert';

import 'package:fluttermic/models/odts_model.dart';
import 'package:fluttermic/models/totalodts_model.dart';
import 'package:fluttermic/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class OdtProvider{

  final String _url = 'http://sgse.microformas.com.mx/ELAVON_TEST/apimoviltest2/api/odts';
  final _prefs  = new PreferenciasUsuario();
  final headerJson = {
    'content-type' : 'application/json'
  };

  Future<TotalodtsModel> getTotales() async {

    final url = '$_url/gettotalodts/${_prefs.idUsuario}';
    final resp = await http.get(url,
      headers: headerJson
    );
    
    final TotalodtsModel odts = new TotalodtsModel();

    if(resp.statusCode == 200 || resp.statusCode == 201){
      var decodeData = json.decode(resp.body);
      odts.nuevas = decodeData["nuevas"];
      return odts;
    }else{
      return odts;
    }

  }

  Future<List<Odtmodel>> getOdts() async {
    final url = '$_url/getodtstecnico/${_prefs.idUsuario}';
    final resp = await http.get(url,
      headers: headerJson
    );

    final Map<String,dynamic> decodeData = json.decode(resp.body);
    final List<Odtmodel> listaOdts = new List();

    if(decodeData == null) return [];

    decodeData.forEach((id, prod){
      final odtTemp = Odtmodel.fromJson(prod);
      listaOdts.add(odtTemp);
    });
    return listaOdts;
  }

}