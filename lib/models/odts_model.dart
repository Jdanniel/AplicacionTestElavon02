// To parse this JSON data, do
//
//     final odtmodel = odtmodelFromJson(jsonString);

import 'dart:convert';

List<Odtmodel> odtmodelFromJson(String str) => List<Odtmodel>.from(json.decode(str).map((x) => Odtmodel.fromJson(x)));

String odtmodelToJson(List<Odtmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Odtmodel {
    String odt;
    String noAfiliacion;
    String fecGarantia;
    String negocio;
    int idAr;
    String estado;
    String colonia;

    Odtmodel({
        this.odt,
        this.noAfiliacion,
        this.fecGarantia,
        this.negocio,
        this.idAr,
        this.estado,
        this.colonia,
    });

    factory Odtmodel.fromJson(Map<String, dynamic> json) => Odtmodel(
        odt: json["ODT"],
        noAfiliacion: json["NO_AFILIACION"],
        fecGarantia: json["FEC_GARANTIA"],
        negocio: json["NEGOCIO"],
        idAr: json["ID_AR"],
        estado: json["ESTADO"],
        colonia: json["COLONIA"],
    );

    Map<String, dynamic> toJson() => {
        "ODT": odt,
        "NO_AFILIACION": noAfiliacion,
        "FEC_GARANTIA": fecGarantia,
        "NEGOCIO": negocio,
        "ID_AR": idAr,
        "ESTADO": estado,
        "COLONIA": colonia,
    };
}
