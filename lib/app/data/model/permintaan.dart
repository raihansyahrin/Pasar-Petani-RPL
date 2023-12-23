

import 'dart:convert';

PermintaanModel permintaanModelFromJson(String str) => PermintaanModel.fromJson(json.decode(str));

String permintaanModelToJson(PermintaanModel data) => json.encode(data.toJson());

class PermintaanModel {
    int? id;
    String? idPetani;
    String? idKoperasi;
    String? kategori;
    String? harga;
    String? berat;
    String? jumlah;
    String? durasiTahan;
    String? foto;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? name;
    String? description;
    String? fotoUrl;
    Koperasi? petani;
    Koperasi? koperasi;
    List<Status>? status;

    PermintaanModel({
        this.id,
        this.idPetani,
        this.idKoperasi,
        this.kategori,
        this.harga,
        this.berat,
        this.jumlah,
        this.durasiTahan,
        this.foto,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.description,
        this.fotoUrl,
        this.petani,
        this.koperasi,
        this.status,
    });

    factory PermintaanModel.fromJson(Map<String, dynamic> json) => PermintaanModel(
        id: json["id"],
        idPetani: json["id_petani"],
        idKoperasi: json["id_koperasi"],
        kategori: json["kategori"],
        harga: json["harga"],
        berat: json["berat"],
        jumlah: json["jumlah"],
        durasiTahan: json["durasi_tahan"],
        foto: json["foto"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        fotoUrl: json["foto_url"],
        petani: json["petani"] == null ? null : Koperasi.fromJson(json["petani"]),
        koperasi: json["koperasi"] == null ? null : Koperasi.fromJson(json["koperasi"]),
        status: json["status"] == null ? [] : List<Status>.from(json["status"]!.map((x) => Status.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_petani": idPetani,
        "id_koperasi": idKoperasi,
        "kategori": kategori,
        "harga": harga,
        "berat": berat,
        "jumlah": jumlah,
        "durasi_tahan": durasiTahan,
        "foto": foto,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "foto_url": fotoUrl,
        "petani": petani?.toJson(),
        "koperasi": koperasi?.toJson(),
        "status": status == null ? [] : List<dynamic>.from(status!.map((x) => x.toJson())),
    };
}

class Koperasi {
    int? id;
    String? nama;
    String? email;
    String? alamat;
    String? foto;
    String? noHp;
    String? role;
    DateTime? createdAt;
    DateTime? updatedAt;

    Koperasi({
        this.id,
        this.nama,
        this.email,
        this.alamat,
        this.foto,
        this.noHp,
        this.role,
        this.createdAt,
        this.updatedAt,
    });

    factory Koperasi.fromJson(Map<String, dynamic> json) => Koperasi(
        id: json["id"],
        nama: json["nama"],
        email: json["email"],
        alamat: json["alamat"],
        foto: json["foto"],
        noHp: json["no_hp"],
        role: json["role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    };
}

class Status {
    int? id;
    String? idPermintaan;
    String? keterangan;
    DateTime? tglPerubahan;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Status({
        this.id,
        this.idPermintaan,
        this.keterangan,
        this.tglPerubahan,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        idPermintaan: json["id_permintaan"],
        keterangan: json["keterangan"],
        tglPerubahan: json["tgl_perubahan"] == null ? null : DateTime.parse(json["tgl_perubahan"]),
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_permintaan": idPermintaan,
        "keterangan": keterangan,
        "tgl_perubahan": tglPerubahan?.toIso8601String(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
