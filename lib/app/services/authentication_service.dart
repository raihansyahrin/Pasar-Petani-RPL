import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pasar_petani/app/constant/constanta.dart';

class AuthenticationService {
  Future<bool> login({required String email, required String password}) async {
    GetStorage storage = GetStorage();

    try {
      var url = Uri.parse("$apiUrl/login");
      http.Response response = await http.post(url, body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        storage.write('token', json.decode(response.body)['access_token']);
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> logout() async {
    try {
      var url = Uri.parse("$apiUrl/logout");
      GetStorage storage = GetStorage();

      http.Response response = await http.post(url, headers: {
        "Authorization": "Bearer ${storage.read('token')}",
      });
      if (response.statusCode == 200) {
        storage.remove('token');
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> registrasi({
    required String namaLengkap,
    required String email,
    required String alamat,
    required String password,
    required String noHp,
  }) async {
    try {
      var url = Uri.parse("$apiUrl/register");
      http.Response response = await http.post(url, body: {
        'nama': namaLengkap,
        'email': email,
        'alamat': namaLengkap,
        'password': password,
        'no_hp': noHp,
        'role': 'petani'
      });
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
