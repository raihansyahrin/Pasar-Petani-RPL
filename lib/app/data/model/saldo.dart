// // To parse this JSON data, do
// //
// //     final saldo = saldoFromJson(jsonString);

// import 'dart:convert';

// Saldo saldoFromJson(String str) => Saldo.fromJson(json.decode(str));

// String saldoToJson(Saldo data) => json.encode(data.toJson());

// class Saldo {
//   int? id;
//   String? idPetani;
//   int? saldo;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<HistoryPenarikan>? historyPenarikan;
//   List<HistoryPemasukan>? historyPemasukan;

//   Saldo({
//     this.id,
//     this.idPetani,
//     this.saldo,
//     this.createdAt,
//     this.updatedAt,
//     this.historyPenarikan,
//     this.historyPemasukan,
//   });

//   factory Saldo.fromJson(Map<String, dynamic> json) => Saldo(
//         id: json["id"],
//         idPetani: json["id_petani"],
//         saldo: json["saldo"] ?? 0,
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//         historyPenarikan: json["history_penarikan"] == null
//             ? []
//             : List<HistoryPenarikan>.from(json["history_penarikan"]!
//                 .map((x) => HistoryPenarikan.fromJson(x))),
//         historyPemasukan: json["history_pemasukan"] == null
//             ? []
//             : List<HistoryPemasukan>.from(json["history_pemasukan"]!
//                 .map((x) => HistoryPemasukan.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_petani": idPetani,
//         "saldo": saldo,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "history_penarikan": historyPenarikan == null
//             ? []
//             : List<dynamic>.from(historyPenarikan!.map((x) => x.toJson())),
//         "history_pemasukan": historyPemasukan == null
//             ? []
//             : List<dynamic>.from(historyPemasukan!.map((x) => x.toJson())),
//       };
// }

// class HistoryPemasukan {
//   int? id;
//   String? idUang;
//   String? nominalPengiriman;
//   DateTime? waktuPengiriman;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   HistoryPemasukan({
//     this.id,
//     this.idUang,
//     this.nominalPengiriman,
//     this.waktuPengiriman,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory HistoryPemasukan.fromJson(Map<String, dynamic> json) =>
//       HistoryPemasukan(
//         id: json["id"],
//         idUang: json["id_uang"],
//         nominalPengiriman: json["nominal_pengiriman"],
//         waktuPengiriman: json["waktu_pengiriman"] == null
//             ? null
//             : DateTime.parse(json["waktu_pengiriman"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_uang": idUang,
//         "nominal_pengiriman": nominalPengiriman,
//         "waktu_pengiriman": waktuPengiriman?.toIso8601String(),
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// class HistoryPenarikan {
//   int? id;
//   String? idUang;
//   String? nominalPenarikan;
//   DateTime? waktuPenarikan;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   HistoryPenarikan({
//     this.id,
//     this.idUang,
//     this.nominalPenarikan,
//     this.waktuPenarikan,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory HistoryPenarikan.fromJson(Map<String, dynamic> json) =>
//       HistoryPenarikan(
//         id: json["id"],
//         idUang: json["id_uang"],
//         nominalPenarikan: json["nominal_penarikan"],
//         waktuPenarikan: json["waktu_penarikan"] == null
//             ? null
//             : DateTime.parse(json["waktu_penarikan"]),
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null
//             ? null
//             : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "id_uang": idUang,
//         "nominal_penarikan": nominalPenarikan,
//         "waktu_penarikan": waktuPenarikan?.toIso8601String(),
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
import 'dart:convert';

import 'package:pasar_petani/app/data/model/user.dart';

class Saldo {
  int? id;
  int? idPetani;
  String? saldo;
  DateTime? createdAt;
  DateTime? updatedAt;
  Users? user;
  List<HistoryPenarikan>? historyPenarikan;
  List<HistoryPemasukan>? historyPemasukan;

  Saldo({
    this.id,
    this.idPetani,
    this.saldo,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.historyPenarikan,
    this.historyPemasukan,
  });

  Saldo copyWith({
    int? id,
    int? idPetani,
    String? saldo,
    DateTime? createdAt,
    DateTime? updatedAt,
    Users? user,
    List<HistoryPenarikan>? historyPenarikan,
    List<HistoryPemasukan>? historyPemasukan,
  }) =>
      Saldo(
        id: id ?? this.id,
        idPetani: idPetani ?? this.idPetani,
        saldo: saldo ?? this.saldo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
        historyPenarikan: historyPenarikan ?? this.historyPenarikan,
        historyPemasukan: historyPemasukan ?? this.historyPemasukan,
      );

  factory Saldo.fromRawJson(String str) => Saldo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Saldo.fromJson(Map<String, dynamic> json) => Saldo(
        id: json["id"],
        idPetani: json["id_petani"],
        saldo: json["saldo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: Users.fromJson(json["user"]),
        historyPenarikan: json["history_penarikan"] == null
            ? null
            : List<HistoryPenarikan>.from(json["history_penarikan"]
                .map((x) => HistoryPenarikan.fromJson(x))),
        historyPemasukan: json["history_pemasukan"] == null
            ? null
            : List<HistoryPemasukan>.from(json["history_pemasukan"]
                .map((x) => HistoryPemasukan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_petani": idPetani,
        "saldo": saldo,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "history_penarikan": historyPenarikan == null
            ? null
            : List<dynamic>.from(historyPenarikan!.map((x) => x.toJson())),
        "history_pemasukan": historyPemasukan == null
            ? null
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

  HistoryPemasukan copyWith({
    int? id,
    String? idUang,
    String? nominalPengiriman,
    DateTime? waktuPengiriman,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      HistoryPemasukan(
        id: id ?? this.id,
        idUang: idUang ?? this.idUang,
        nominalPengiriman: nominalPengiriman ?? this.nominalPengiriman,
        waktuPengiriman: waktuPengiriman ?? this.waktuPengiriman,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory HistoryPemasukan.fromRawJson(String str) =>
      HistoryPemasukan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryPemasukan.fromJson(Map<String, dynamic> json) =>
      HistoryPemasukan(
        id: json["id"],
        idUang: json["id_uang"],
        nominalPengiriman: json["nominal_pengiriman"],
        waktuPengiriman: DateTime.parse(json["waktu_pengiriman"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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

  HistoryPenarikan copyWith({
    int? id,
    String? idUang,
    String? nominalPenarikan,
    DateTime? waktuPenarikan,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      HistoryPenarikan(
        id: id ?? this.id,
        idUang: idUang ?? this.idUang,
        nominalPenarikan: nominalPenarikan ?? this.nominalPenarikan,
        waktuPenarikan: waktuPenarikan ?? this.waktuPenarikan,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory HistoryPenarikan.fromRawJson(String str) =>
      HistoryPenarikan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryPenarikan.fromJson(Map<String, dynamic> json) =>
      HistoryPenarikan(
        id: json["id"],
        idUang: json["id_uang"],
        nominalPenarikan: json["nominal_penarikan"],
        waktuPenarikan: DateTime.parse(json["waktu_penarikan"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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

// class User {
//   int? id;
//   String? nama;
//   String? email;
//   String? alamat;
//   String? foto;
//   String? noHp;
//   String? role;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   User({
//     this.id,
//     this.nama,
//     this.email,
//     this.alamat,
//     this.foto,
//     this.noHp,
//     this.role,
//     this.createdAt,
//     this.updatedAt,
//   });

//   User copyWith({
//     int? id,
//     String? nama,
//     String? email,
//     String? alamat,
//     String? foto,
//     String? noHp,
//     String? role,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) =>
//       User(
//         id: id ?? this.id,
//         nama: nama ?? this.nama,
//         email: email ?? this.email,
//         alamat: alamat ?? this.alamat,
//         foto: foto ?? this.foto,
//         noHp: noHp ?? this.noHp,
//         role: role ?? this.role,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );

//   factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         nama: json["nama"],
//         email: json["email"],
//         alamat: json["alamat"],
//         foto: json["foto"],
//         noHp: json["no_hp"],
//         role: json["role"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "nama": nama,
//         "email": email,
//         "alamat": alamat,
//         "foto": foto,
//         "no_hp": noHp,
//         "role": role,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }
