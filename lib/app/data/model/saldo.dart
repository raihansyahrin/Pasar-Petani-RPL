// To parse this JSON data, do
//
//     final saldo = saldoFromJson(jsonString);

import 'dart:convert';

Saldo saldoFromJson(String str) => Saldo.fromJson(json.decode(str));

String saldoToJson(Saldo data) => json.encode(data.toJson());

class Saldo {
  int? id;
  String? idPetani;
  int? saldo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<HistoryPenarikan>? historyPenarikan;
  List<HistoryPemasukan>? historyPemasukan;

  Saldo({
    this.id,
    this.idPetani,
    this.saldo,
    this.createdAt,
    this.updatedAt,
    this.historyPenarikan,
    this.historyPemasukan,
  });

  factory Saldo.fromJson(Map<String, dynamic> json) => Saldo(
        id: json["id"],
        idPetani: json["id_petani"],
        saldo: json["saldo"] ?? 0,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        historyPenarikan: json["history_penarikan"] == null
            ? []
            : List<HistoryPenarikan>.from(json["history_penarikan"]!
                .map((x) => HistoryPenarikan.fromJson(x))),
        historyPemasukan: json["history_pemasukan"] == null
            ? []
            : List<HistoryPemasukan>.from(json["history_pemasukan"]!
                .map((x) => HistoryPemasukan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_petani": idPetani,
        "saldo": saldo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "history_penarikan": historyPenarikan == null
            ? []
            : List<dynamic>.from(historyPenarikan!.map((x) => x.toJson())),
        "history_pemasukan": historyPemasukan == null
            ? []
            : List<dynamic>.from(historyPemasukan!.map((x) => x.toJson())),
      };
}

class HistoryPemasukan {
  int? id;
  String? idUang;
  String? nominalPengiriman;
  DateTime? waktuPengiriman;
  DateTime? createdAt;
  DateTime? updatedAt;

  HistoryPemasukan({
    this.id,
    this.idUang,
    this.nominalPengiriman,
    this.waktuPengiriman,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryPemasukan.fromJson(Map<String, dynamic> json) =>
      HistoryPemasukan(
        id: json["id"],
        idUang: json["id_uang"],
        nominalPengiriman: json["nominal_pengiriman"],
        waktuPengiriman: json["waktu_pengiriman"] == null
            ? null
            : DateTime.parse(json["waktu_pengiriman"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_uang": idUang,
        "nominal_pengiriman": nominalPengiriman,
        "waktu_pengiriman": waktuPengiriman?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class HistoryPenarikan {
  int? id;
  String? idUang;
  String? nominalPenarikan;
  DateTime? waktuPenarikan;
  DateTime? createdAt;
  DateTime? updatedAt;

  HistoryPenarikan({
    this.id,
    this.idUang,
    this.nominalPenarikan,
    this.waktuPenarikan,
    this.createdAt,
    this.updatedAt,
  });

  factory HistoryPenarikan.fromJson(Map<String, dynamic> json) =>
      HistoryPenarikan(
        id: json["id"],
        idUang: json["id_uang"],
        nominalPenarikan: json["nominal_penarikan"],
        waktuPenarikan: json["waktu_penarikan"] == null
            ? null
            : DateTime.parse(json["waktu_penarikan"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_uang": idUang,
        "nominal_penarikan": nominalPenarikan,
        "waktu_penarikan": waktuPenarikan?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
