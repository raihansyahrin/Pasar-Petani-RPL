

import 'dart:convert';

StatistikModel statistikModelFromJson(String str) => StatistikModel.fromJson(json.decode(str));

String statistikModelToJson(StatistikModel data) => json.encode(data.toJson());

class StatistikModel {
    int? jumlahDiterima;
    int? jumlahProses;

    StatistikModel({
        this.jumlahDiterima,
        this.jumlahProses,
    });

    factory StatistikModel.fromJson(Map<String, dynamic> json) => StatistikModel(
        jumlahDiterima: json["jumlahDiterima"],
        jumlahProses: json["jumlahProses"],
    );

    Map<String, dynamic> toJson() => {
        "jumlahDiterima": jumlahDiterima,
        "jumlahProses": jumlahProses,
    };
}
