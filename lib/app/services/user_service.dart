import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pasar_petani/app/constant/constanta.dart';
import '../data/model/user.dart';

class UserService {
  Future<Users?> fetchUser() async {
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
      return Users.fromJson(json.decode(response.body));
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
      var url = "$apiUrl/user/edit-profile";
      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer ${storage.read('token')}';
      request.headers['Content-Type'] = 'multipart/form-data';

      if (imageFile != null) {
        final file = await http.MultipartFile.fromPath(
          'foto',
          imageFile.path,
        );
        request.files.add(file);
      }

      if (name != null) request.fields['nama'] = name;
      if (email != null) request.fields['email'] = email;
      if (alamat != null) request.fields['alamat'] = alamat;
      if (noHp != null) request.fields['nomor_telepon'] = noHp;

      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print('Response status: ${response.statusCode}');
      print('Response body: $responseString');

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Failed to change profile: $e');
    }
  }
}
