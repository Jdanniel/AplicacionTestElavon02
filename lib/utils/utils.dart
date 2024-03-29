

import 'package:flutter/material.dart';

void mostraAlerta(BuildContext context, String mensaje){
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Informacion Incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
}