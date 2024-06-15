import 'dart:convert';
import 'package:path/path.dart' as path;

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/data/model/permintaan.dart';
import 'package:pasar_petani/app/data/model/statistik.dart';
import 'package:path/path.dart';

import '../constant/constanta.dart';
import '../data/model/detail_permintaan_model.dart';

class PermintaanService {
  Future<List<PermintaanModel>> getAllPermintaan() async {
    try {
      Uri uri = Uri.parse('$apiUrl/permintaan');
      http.Response response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${GetStorage().read('token')}',
        },
      );
      if (response.statusCode == 200) {
        List? data =
            (json.decode(response.body) as Map<String, dynamic>)['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => PermintaanModel.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<bool> addPermintaan({
  //   String? name,
  //   int? idPetani,
  //   int? idKoperasi,
  //   String? kategori,
  //   XFile? imageFile,
  //   int? harga,
  //   int? berat,
  //   String? durasiTahan,
  //   int? jumlah,
  //   String? description,
  // }) async {
  //   GetStorage storage = GetStorage();
  //   try {
  //     var url = "$apiUrl/permintaan/add";
  //     final request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
  //     request.headers['Content-Type'] = 'multipart/form-data';
  //     final file = await http.MultipartFile.fromPath(
  //       'foto',
  //       '${imageFile?.path}',
  //     );
  //     request.files.add(file);
  //     request.fields['id_petani'] = "$idPetani";
  //     request.fields['id_koperasi'] = "$idKoperasi";
  //     request.fields['kategori'] = "$kategori";
  //     request.fields['harga'] = "$harga";
  //     request.fields['berat'] = "$berat";
  //     request.fields['durasi_tahan'] = "$durasiTahan";

  //     request.fields['jumlah'] = "$jumlah";
  //     request.fields['name'] = "$name";
  //     request.fields['description'] = "$description";

  //     final response = await request.send();

  //     if (response.statusCode == 201) {
  //       print(response.stream.toBytes());
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
  Future<bool> addPermintaan({
    String? name,
    int? idPetani,
    int? idKoperasi,
    String? kategori,
    XFile? imageFile,
    int? harga,
    int? berat,
    String? durasiTahan,
    int? jumlah,
    String? description,
  }) async {
    GetStorage storage = GetStorage();
    try {
      var url = "$apiUrl/permintaan/add";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';

      if (imageFile != null && imageFile.path.isNotEmpty) {
        final file = await http.MultipartFile.fromPath(
          'foto',
          imageFile.path,
          filename: basename(imageFile.path),
        );
        request.files.add(file);
      } else {
        throw Exception("Image file is required");
      }

      request.fields['id_petani'] = idPetani.toString();
      request.fields['id_koperasi'] = idKoperasi.toString();
      request.fields['kategori'] = kategori ?? '';
      request.fields['harga'] = harga.toString();
      request.fields['berat'] = berat.toString();
      request.fields['durasi_tahan'] = durasiTahan ?? '';
      request.fields['jumlah'] = jumlah.toString();
      request.fields['name'] = name ?? '';
      request.fields['description'] = description ?? '';

      final response = await request.send();

      if (response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);
        print(responseData);
        return true;
      } else {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);
        print(responseData);
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception(e);
    }
  }

  Future<StatistikModel?> getStatistic() async {
    try {
      GetStorage storage = GetStorage();
      String token = storage.read("token");
      var url = "$apiUrl/permintaan";
      var res = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "Bearer $token"},
      );
      if (res.statusCode == 200) {
        return StatistikModel.fromJson(jsonDecode(res.body));
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailPermintaanModel?> detailPermintaan({required int id}) async {
    try {
      GetStorage storage = GetStorage();
      var response = await http.get(
        Uri.parse('$apiUrl/permintaan/$id'),
        headers: {'Authorization': 'Bearer ${storage.read('token')}'},
      );
      if (response.statusCode == 200) {
        return DetailPermintaanModel.fromJson(
            jsonDecode(response.body)['data']);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
