import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/constant/constanta.dart';
import 'package:pasar_petani/app/data/model/history_saldo.dart';
import '../data/model/user.dart';

class UserService {
  Future<User?> fetchUser() async {
    GetStorage storage = GetStorage();
    http.Response response = await http.get(
      Uri.parse('$apiUrl/user'),
      headers: {
        'Authorization': 'Bearer ${storage.read('token')}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }
    return null;
  }

  Future<bool> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    GetStorage storage = GetStorage();
    http.Response response =
        await http.post(Uri.parse('$apiUrl/user/change-password'), headers: {
      'Authorization': 'Bearer ${storage.read('token')}',
    }, body: {
      "current_password": currentPassword,
      "new_password": newPassword,
      "confirm_password": confirmNewPassword,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
   Future<bool> changeProfile({
    String? name,
    String? email,
    XFile? imageFile,
    String? alamat,
    String? noHp,
  }) async {
    GetStorage storage = GetStorage();
    try {
      var url = "$apiUrl/permintaan/add";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';
      final file = await http.MultipartFile.fromPath(
        'foto',
        '${imageFile?.path}',
      );
      request.files.add(file);
      request.fields['nama'] = "$name";
      request.fields['email'] = "$name";

      


      request.fields['alamat'] = "$alamat";
      request.fields['nomor_telepon'] = "$noHp";

      final response = await request.send();
      if (response.statusCode == 201) {

        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

}
