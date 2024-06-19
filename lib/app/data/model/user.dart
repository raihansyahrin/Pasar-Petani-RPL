// To parse this JSON data, do
//
//     final Users = UsersFromJson(jsonString);

import 'dart:convert';

Users UsersFromJson(String str) => Users.fromJson(json.decode(str));

String UsersToJson(Users data) => json.encode(data.toJson());

class Users {
  int? id;
  String? nama;
  String? email;
  String? alamat;
  String? foto;
  String? noHp;
  String? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fotoUrl;

  Users({
    this.id,
    this.nama,
    this.email,
    this.alamat,
    this.foto,
    this.noHp,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.fotoUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        foto: json["foto"],
        noHp: json["no_hp"],
        role: json["role"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fotoUrl: json["foto_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "alamat": alamat,
        "foto": foto,
        "no_hp": noHp,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "foto_url": fotoUrl,
      };
}
