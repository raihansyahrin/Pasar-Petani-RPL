// To parse this JSON data, do
//
//     final historySaldo = historySaldoFromJson(jsonString);

import 'dart:convert';

HistorySaldo historySaldoFromJson(String str) => HistorySaldo.fromJson(json.decode(str));

String historySaldoToJson(HistorySaldo data) => json.encode(data.toJson());

class HistorySaldo {
    int? id;
    String? idUang;
    String? nominalPenarikan;
    String? nominalPengiriman;
    DateTime? waktuPengiriman;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? jenis;

    HistorySaldo({
        this.id,
        this.idUang,
        this.nominalPenarikan,
        this.nominalPengiriman,
        this.waktuPengiriman,
        this.createdAt,
        this.updatedAt,
        this.jenis,
    });

    factory HistorySaldo.fromJson(Map<String, dynamic> json) => HistorySaldo(
        id: json["id"],
        idUang: json["id_uang"],
        nominalPenarikan: json["nominal_penarikan"],
        nominalPengiriman: json["nominal_pengiriman"],
        waktuPengiriman: json["waktu_pengiriman"] == null ? null : DateTime.parse(json["waktu_pengiriman"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        jenis: json["jenis"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_uang": idUang,
        "nominal_penarikan": nominalPenarikan,
        "nominal_pengiriman": nominalPengiriman,
        "waktu_pengiriman": waktuPengiriman?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "jenis": jenis,
    };
}
